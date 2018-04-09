package com.clairvoyant.practise.sparkkudu;

import org.apache.kudu.client.CreateTableOptions;
import org.apache.kudu.spark.kudu.KuduContext;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.SQLContext;
import scala.collection.JavaConversions;
import scala.collection.Seq;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Spark_Kudu_Example {
    public static void main(String args[]){
        SparkConf conf = new SparkConf();
        conf.setAppName("Test-Kudu");
        JavaSparkContext sc = new JavaSparkContext(new SparkConf());
        SQLContext sqlContext = new SQLContext(sc);
        KuduContext kc = new KuduContext("ip-10-0-0-107.ec2.internal:7051",
                JavaSparkContext.toSparkContext(sc));

        //read json file
        DataFrame df = sqlContext.read().json("employee.json");

        String kuduTableName = "employee_test";

        // Check if the table exists, and drop it if it does
        if (kc.tableExists(kuduTableName)) {
            kc.deleteTable(kuduTableName);
        }

        //specify primary keys
        List<String> primary_keys = new ArrayList<>();
        primary_keys.add("id");

        //Specify any further options
        CreateTableOptions kuduTableOptions = new CreateTableOptions();
        kuduTableOptions.addHashPartitions( primary_keys, 32);

        Seq<String> argumentsSeq = JavaConversions.asScalaBuffer(primary_keys).toSeq();
        kc.createTable(
                // Table name, schema, primary key and options
                kuduTableName,
                df.schema(),
                argumentsSeq,
                kuduTableOptions);

        //load data
        kc.insertRows(df, kuduTableName);

        /*----------------------------------------------------------------------------*/

        //Read a kudu table
        Map<String,String> map = new HashMap<>();
        map.put("kudu.table",kuduTableName);
        map.put("kudu.master","ip-10-0-0-107.ec2.internal:7051");

        DataFrame df_kudu = sqlContext.read().options(map).format("org.apache.kudu.spark.kudu").load();
        System.out.println(df_kudu.collect());
    }
}
