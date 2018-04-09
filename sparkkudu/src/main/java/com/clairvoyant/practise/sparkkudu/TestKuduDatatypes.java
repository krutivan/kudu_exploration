package com.clairvoyant.practise.sparkkudu;

import org.apache.kudu.client.CreateTableOptions;
import org.apache.kudu.spark.kudu.KuduContext;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.hive.HiveContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import scala.collection.JavaConversions;
import scala.collection.Seq;

import java.util.ArrayList;
import java.util.List;

public class TestKuduDatatypes {
    private static final Logger logger = LoggerFactory.getLogger(TestKuduDatatypes.class);

    public static void main(String [] args) {
        SparkConf conf = new SparkConf();
        conf.setAppName("Test-Kudu-Types");
        JavaSparkContext sc = new JavaSparkContext(new SparkConf());
        KuduContext kc = new KuduContext("ip-10-0-0-107.ec2.internal:7051",
                JavaSparkContext.toSparkContext(sc));
        HiveContext hiveContext = new HiveContext(sc);


        String[] table_names = {"tinyint","int","smallint","bigint","string","varchar","float","double","boolean","decimal","timestamp","date","binary","array","map","uniontype"};
        for(int i = 0; i<table_names.length; i++){
            String name = "table_var_"+table_names[i];
            System.out.println("Testing "+name);
            DataFrame df=hiveContext.sql("select * from test_datatypes."+name);
            // Check if the table exists, and drop it if it does
            if (kc.tableExists(name)) {
                kc.deleteTable(name);
            }
            List<String> keyList = new ArrayList<>();
            keyList.add("id");

            CreateTableOptions kuduTableOptions = new CreateTableOptions();
            kuduTableOptions.addHashPartitions( keyList, 2);

            Seq<String> argumentsSeq = JavaConversions.asScalaBuffer(keyList).toSeq();
            try {
                kc.createTable(
                        // Table name, schema, primary key and options
                        name,
                        df.schema(),
                        argumentsSeq,
                        kuduTableOptions);
            }
            catch (Exception e) {
                System.out.println("Error in creating table: " + name);
                System.out.println(e.getMessage());
            }
        }
    }
}
