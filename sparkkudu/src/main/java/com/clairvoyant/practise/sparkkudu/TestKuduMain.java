package com.clairvoyant.practise.sparkkudu;

import org.apache.kudu.client.*;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.hive.HiveContext;
import org.apache.kudu.spark.kudu.KuduContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import scala.collection.JavaConversions;
import scala.collection.Seq;
import java.util.ArrayList;
import java.util.List;

public class TestKuduMain {
    private static final Logger logger = LoggerFactory.getLogger(TestKuduMain.class);

    public static void main(String [] args) {

        SparkConf conf = new SparkConf();
        conf.setAppName("Test-Kudu");
        JavaSparkContext sc = new JavaSparkContext(new SparkConf());
        KuduContext kc = new KuduContext("ip-10-0-0-107.ec2.internal:7051",
                JavaSparkContext.toSparkContext(sc));

        // Read from hive table

        // Reading a hive table using spark
        HiveContext hiveContext = new HiveContext(sc);
        DataFrame df=hiveContext.sql("select * from tpch_text_5.lineitem");
        System.out.println(df.schema());

        String kuduTableName = "lineitem";


        // Check if the table exists, and drop it if it does
        if (kc.tableExists(kuduTableName)) {
            kc.deleteTable(kuduTableName);
        }

        List<String> keyList = new ArrayList<>();
        keyList.add("l_orderkey");
        keyList.add("l_linenumber");

        // 4. Specify any further options
        CreateTableOptions kuduTableOptions = new CreateTableOptions();
        kuduTableOptions.addHashPartitions( keyList, 16);

        Seq<String> argumentsSeq =JavaConversions.asScalaBuffer(keyList).toSeq();
        kc.createTable(
                // Table name, schema, primary key and options
                kuduTableName,
                df.schema(),
                argumentsSeq,
                kuduTableOptions);
        long time1 = System.currentTimeMillis();
        kc.insertRows(df, kuduTableName);
        long time2 = System.currentTimeMillis();

        long time_diff_seconds = (time2-time1)/1000;
        long time_diff_mins = time_diff_seconds/60;

        logger.info("Time to load data in seconds: "+time_diff_seconds);
        logger.info("Time to load data in minutes: "+time_diff_mins);
    }
}
