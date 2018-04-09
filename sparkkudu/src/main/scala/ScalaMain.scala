package main.scala
import java.util
import java.util.{ArrayList, List}

import org.apache.spark.SparkContext
import org.apache.kudu.spark.kudu.KuduContext
import org.apache.spark.sql.{SQLContext, SaveMode}
import org.apache.kudu.spark.kudu._
import org.apache.kudu.client._
import org.apache.spark.sql.hive.HiveContext

import collection.JavaConverters._
import scala.collection.{JavaConversions, Seq}

object ScalaMain {
  def main(args: Array[String]): Unit = {
    val sc = new SparkContext()
    val sqlContext = new SQLContext(sc)
    val hc = new HiveContext(sc)
    val kuduContext = new KuduContext("ip-10-0-0-107.ec2.internal:7051", sc = sc)
    var kuduOptions = Map(
      "kudu.table" -> "employee_test",
      "kudu.master" -> "ip-10-0-0-107.ec2.internal:7051")

    // read a json
    val df = sqlContext.read.json("employee.json")

    val kuduTableName = "employee_test"

    // Check if the table exists, and drop it if it does
    if (kuduContext.tableExists(kuduTableName)) kuduContext.deleteTable(kuduTableName)

    //specify primary keys
    val primary_keys: util.List[String] = new util.ArrayList[String]
    primary_keys.add("id")

    //Specify any further options
    val kuduTableOptions = new CreateTableOptions
    kuduTableOptions.addHashPartitions(primary_keys, 16)

    val argumentsSeq = JavaConversions.asScalaBuffer(primary_keys).toSeq
    kuduContext.createTable(// Table name, schema, primary key and options
      kuduTableName, df.schema, argumentsSeq, kuduTableOptions)

    //load data
    kuduContext.insertRows(df, kuduTableName)

    //read data
    val df_kudu = sqlContext.read.options(kuduOptions).format("org.apache.kudu.spark.kudu").load
    df_kudu.show()
  }
}
