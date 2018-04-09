package com.clairvoyant.practise.sparkkudu;

import org.apache.hadoop.hive.ql.metadata.Hive;
import org.apache.kudu.client.CreateTableOptions;
import org.apache.kudu.spark.kudu.KuduContext;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.hive.HiveContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.spark.sql.DataFrame;
import scala.collection.JavaConversions;
import scala.collection.Seq;

import java.util.Arrays;
import java.util.List;

public class Main {
    private static final Logger logger = LoggerFactory.getLogger(Main.class);

    public static void main(String [] args) throws Exception{
        //if arguments include -help or --help then print Argument Usage
        List argsList = Arrays.asList(args);
        if(argsList.contains("-help") || argsList.contains("--help")) {
            new Arguments().printUsage();
            System.exit(0);
        }

        //set up contexts
        JavaSparkContext sc = new JavaSparkContext(new SparkConf());
        KuduContext kc = new KuduContext("ip-10-0-0-107.ec2.internal:7051",
                JavaSparkContext.toSparkContext(sc));
        HiveContext hiveContext = new HiveContext(sc);

        //Serialize args into MainArgs
        Arguments mainArgs = new Arguments(args);
        //logger.info(mainArgs.toString());
        //logger.info(mainArgs.toString());

        //Read the data from table to data frame
        DataFrame df=hiveContext.table(mainArgs.getInputTableName());

        if (mainArgs.isSaveAsKudu()){
            if (mainArgs.isSaveModeHash())
                saveAsKuduHash(df, kc, mainArgs.getOutputTableName(), mainArgs.getPrimaryKeyList(),32);
            else
                saveAsKuduRange(df, kc, mainArgs.getOutputTableName(), mainArgs.getPrimaryKeyList());

        }
        else
            saveAsHdfs(hiveContext, df, mainArgs.getOutputTableName());

    }

    private static void saveAsHdfs(HiveContext hiveContext, DataFrame df, String tableName){

        // drop hdfs table if exists
        hiveContext.sql("drop table if exists "+tableName);
        long time1 = System.currentTimeMillis();
        df.write().format("parquet").saveAsTable(tableName);
        long time2 = System.currentTimeMillis();

        //measure time difference for performance comparison
        long time_diff_seconds = (time2-time1)/1000;
        long time_diff_mins = time_diff_seconds/60;

        System.out.println("Time to load data to "+ tableName + " (in seconds): "+time_diff_seconds);
        System.out.println("Time to load data to "+ tableName + " (in minutes): "+time_diff_mins);
    }

    private static void saveAsKuduRange(DataFrame df,KuduContext kc,String tableName,
                                        List<String> primaryKeyList) {
        deleteKuduTableIfExists(tableName, kc);

        //Create table
        CreateTableOptions kuduTableOptions = new CreateTableOptions();
        kuduTableOptions.setRangePartitionColumns(primaryKeyList);

        Seq<String> argumentsSeq = JavaConversions.asScalaBuffer(primaryKeyList).toSeq();
        kc.createTable(
                tableName,
                df.schema(),
                argumentsSeq,
                kuduTableOptions);

        //load data to table and measure load time
        long time1 = System.currentTimeMillis();
        kc.insertRows(df, tableName);
        long time2 = System.currentTimeMillis();

        //measure time difference for performance comparison
        long time_diff_seconds = (time2-time1)/1000;
        long time_diff_mins = time_diff_seconds/60;

        System.out.println("Time to load data to "+ tableName + " (in seconds): "+time_diff_seconds);
        System.out.println("Time to load data to "+ tableName + " (in minutes): "+time_diff_mins);
    }

    private static void saveAsKuduHash(DataFrame df,KuduContext kc,String tableName,
                                         List<String> primaryKeyList,int numBuckets) {
        deleteKuduTableIfExists(tableName, kc);

        //Create table
        CreateTableOptions kuduTableOptions = new CreateTableOptions();
        kuduTableOptions.addHashPartitions( primaryKeyList, numBuckets);

        Seq<String> argumentsSeq = JavaConversions.asScalaBuffer(primaryKeyList).toSeq();
        kc.createTable(
                tableName,
                df.schema(),
                argumentsSeq,
                kuduTableOptions);

        //load data to table and measure load time
        long time1 = System.currentTimeMillis();
        kc.insertRows(df, tableName);
        long time2 = System.currentTimeMillis();

        //measure time difference for performance comparison
        long time_diff_seconds = (time2-time1)/1000;
        long time_diff_mins = time_diff_seconds/60;

        System.out.println("Time to load data to "+ tableName + " (in seconds): "+time_diff_seconds);
        System.out.println("Time to load data to "+ tableName + " (in minutes): "+time_diff_mins);
    }

    private static void deleteKuduTableIfExists(String tableName, KuduContext kc){
        // Check if the table exists, and drop it if it does
        if (kc.tableExists(tableName)) {
            kc.deleteTable(tableName);
        }
    }

}
