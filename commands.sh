# Commands for Clairvoyant sample app
spark-submit --master yarn-client --driver-class-path {PATH_TO_PROPERTIES_FILE} {PATH_TO_JAR_FILE} {ARGS_LIST}

spark-submit --master yarn-client \
--driver-class-path /home/cloudera/Documents/spark_jars/application-test.properties \
--class com.clairvoyant.insight.spark.sample.Main /home/cloudera/Documents/spark_jars/spark_sample_project.jar \
-inputTableName default.people \
-columnToProcess name 



scp -P 2222 /Users/Kruti/Documents/Repos/Spark_practise/sample_spark_project/out/artifacts/spark_sample_project_jar/spark_sample_project.jar cloudera@localhost:/home/cloudera/Documents/spark_jars

scp -P 2222 /Users/Kruti/Documents/Repos/Spark_practise/sample_spark_project/src/test/resources/application-test.properties cloudera@localhost:/home/cloudera/Documents/spark_jars

#scp hive test bech
scp -P 2222 -r /Users/Kruti/Documents/Repos/test_hive/hive-testbench/tpch-gen/ddl/text.sql cloudera@localhost:/home/cloudera/Documents/spark_jars/hive-testbench/tpch-gen/ddl

# commands for my kudu test app
scp -P 2222 \
/Users/Kruti/IdeaProjects/test/out/artifacts/test_jar/test.jar \
cloudera@localhost:/home/cloudera/Documents/spark_jars


spark-submit --master yarn-client --class Main /home/cloudera/Documents/spark_jars/test.jar 
spark-submit --master yarn-client --class LoadMain /home/cloudera/Documents/spark_jars/test.jar 

# commands for the scala spark jar
scp -P 2222 /Users/Kruti/Documents/Repos/Spark_practise/kudu_spark_tests/target/scala-2.10/kudu_spark_tests-assembly-0.1.jar \
cloudera@localhost:/home/cloudera/Documents/spark_jars

spark-submit  \
--master yarn-cluster \
--executor-memory 3g \
--total-executor-cores 4 \
--class main.scala.Main /home/cloudera/Documents/spark_jars/kudu_spark_tests-assembly-0.1.jar > abc.log

# impyla commands
scp -P 2222 /Users/Kruti/PycharmProjects/airflow_exercise/practise/test_impyla.py cloudera@localhost:/home/cloudera/Documents/

# Testing the query suite on compressed seq file via hive queries
python /home/cloudera/Documents/test_impyla.py --hive tpch_text &

# Testing the query suite on  seq file via impala queries
python /home/cloudera/Documents/test_impyla.py tpch_text &

#----------------------------------------------------------------------------------------------------------------------------------
/home/cloudera/Documents/line_item_data

# Install pip
#if centos 7
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

sudo yum -y install python-pip

# test if impyla, pyhs2 work fine!
import impala.dbapi
c_i = impala.dbapi.connect(host='localhost', port=21050)
cur=c_i.cursor()

import pyhs2
conn= pyhs2.connect(host='localhost', port=10000,authMechanism="PLAIN",user='cloudera',database='default')
cur=conn.cursor()

#----------

Feb 22nd
Testing scala and 

spark-submit --packages org.apache.kudu:kudu-spark_2.10:1.4.0 --class main.scala.ScalaMain sparkkudu.jar
spark-submit --master yarn-cluster --executor-memory 1600m --packages org.apache.kudu:kudu-spark_2.10:1.4.0 --class com.clairvoyant.practise.sparkkudu.TestMain sparkkudu.jar

spark-submit --master yarn-client \
--executor-memory 1600m \
--packages org.apache.kudu:kudu-spark_2.10:1.4.0 \
--class com.clairvoyant.practise.sparkkudu.Main sparkkudu.jar 

# OPtions
-inputTableName tpch_text_5.nation -primaryKeyList n_nationkey -saveAsKudu -saveModeHash > temp.log



spark-shell --packages org.apache.kudu:kudu-spark_2.10:1.6.0-cdh5.14.0

spark-shell --packages org.apache.kudu:kudu-spark_2.10:1.4.0


spark-submit --master yarn-client \
--packages org.apache.kudu:kudu-spark_2.10:1.4.0 \
--executor-memory 1600m \
--class com.clairvoyant.practise.sparkkudu.Spark_Kudu_Example sparkkudu.jar 


spark-submit --master yarn-client \
--packages org.apache.kudu:kudu-spark_2.10:1.4.0 \
--executor-memory 1600m \
--class main.scala.ScalaMain sparkkudu.jar 



