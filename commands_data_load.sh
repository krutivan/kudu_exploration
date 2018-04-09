spark-submit --master yarn-client \
--executor-memory 1512m --packages org.apache.kudu:kudu-spark_2.10:1.4.0 \
--class com.clairvoyant.practise.sparkkudu.Main sparkkudu.jar 

# Parameters : to save as kudu hash (16)
-inputTableName tpch_text_20.nation -outputTableName nation -primaryKeyList n_nationkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.part -outputTableName part -primaryKeyList p_partkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.region -outputTableName region -primaryKeyList r_regionkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.supplier -outputTableName supplier -primaryKeyList s_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.partsupp -outputTableName partsupp -primaryKeyList ps_partkey ps_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.orders -outputTableName orders -primaryKeyList o_orderkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.customer -outputTableName customer -primaryKeyList c_custkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.lineitem -outputTableName lineitem -primaryKeyList l_orderkey l_linenumber -saveAsKudu -saveModeHash > temp.log

# impala queries to create external kudu tables
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.nation STORED AS KUDU TBLPROPERTIES('kudu.table_name'='nation');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.part STORED AS KUDU TBLPROPERTIES('kudu.table_name'='part');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.region STORED AS KUDU TBLPROPERTIES('kudu.table_name'='region');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.supplier STORED AS KUDU TBLPROPERTIES('kudu.table_name'='supplier');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.partsupp STORED AS KUDU TBLPROPERTIES('kudu.table_name'='partsupp');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.orders STORED AS KUDU TBLPROPERTIES('kudu.table_name'='orders');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.customer STORED AS KUDU TBLPROPERTIES('kudu.table_name'='customer');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu.lineitem STORED AS KUDU TBLPROPERTIES('kudu.table_name'='lineitem');

# Parameters : to save as kudu hash (32)
-inputTableName tpch_text_20.nation -outputTableName nation_32 -primaryKeyList n_nationkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.part -outputTableName part_32 -primaryKeyList p_partkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.region -outputTableName region_32 -primaryKeyList r_regionkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.supplier -outputTableName supplier_32 -primaryKeyList s_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.partsupp -outputTableName partsupp_32 -primaryKeyList ps_partkey ps_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.orders -outputTableName orders_32 -primaryKeyList o_orderkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.customer -outputTableName customer_32 -primaryKeyList c_custkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.lineitem -outputTableName lineitem_32 -primaryKeyList l_orderkey l_linenumber -saveAsKudu -saveModeHash > temp.log

CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.nation STORED AS KUDU TBLPROPERTIES('kudu.table_name'='nation_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.part STORED AS KUDU TBLPROPERTIES('kudu.table_name'='part_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.region STORED AS KUDU TBLPROPERTIES('kudu.table_name'='region_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.supplier STORED AS KUDU TBLPROPERTIES('kudu.table_name'='supplier_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.partsupp STORED AS KUDU TBLPROPERTIES('kudu.table_name'='partsupp_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.orders STORED AS KUDU TBLPROPERTIES('kudu.table_name'='orders_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.customer STORED AS KUDU TBLPROPERTIES('kudu.table_name'='customer_32');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_32.lineitem STORED AS KUDU TBLPROPERTIES('kudu.table_name'='lineitem_32');


# Parameters : to save as kudu hash (4)
-inputTableName tpch_text_20.nation -outputTableName nation_4 -primaryKeyList n_nationkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.part -outputTableName part_4 -primaryKeyList p_partkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.region -outputTableName region_4 -primaryKeyList r_regionkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.supplier -outputTableName supplier_4 -primaryKeyList s_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.partsupp -outputTableName partsupp_4 -primaryKeyList ps_partkey ps_suppkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.orders -outputTableName orders_4 -primaryKeyList o_orderkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.customer -outputTableName customer_4 -primaryKeyList c_custkey -saveAsKudu -saveModeHash > temp.log
-inputTableName tpch_text_20.lineitem -outputTableName lineitem_4 -primaryKeyList l_orderkey l_linenumber -saveAsKudu -saveModeHash > temp.log

CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.nation STORED AS KUDU TBLPROPERTIES('kudu.table_name'='nation_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.part STORED AS KUDU TBLPROPERTIES('kudu.table_name'='part_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.region STORED AS KUDU TBLPROPERTIES('kudu.table_name'='region_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.supplier STORED AS KUDU TBLPROPERTIES('kudu.table_name'='supplier_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.partsupp STORED AS KUDU TBLPROPERTIES('kudu.table_name'='partsupp_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.orders STORED AS KUDU TBLPROPERTIES('kudu.table_name'='orders_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.customer STORED AS KUDU TBLPROPERTIES('kudu.table_name'='customer_4');
CREATE EXTERNAL TABLE IF NOT EXISTS tpch_kudu_4.lineitem STORED AS KUDU TBLPROPERTIES('kudu.table_name'='lineitem_4');


# queries to drop tables:
drop table if exists customer purge;
drop table if exists lineitem purge;
drop table if exists nation purge;
drop table if exists orders purge;
drop table if exists part purge;
drop table if exists partsupp purge;
drop table if exists region purge;
drop table if exists supplier purge;

# Parameters Save as hdfs
-inputTableName tpch_text_20.nation -outputTableName tpch_parquet.nation > temp.log
-inputTableName tpch_text_20.part -outputTableName tpch_parquet.part > temp.log
-inputTableName tpch_text_20.region -outputTableName tpch_parquet.region > temp.log
-inputTableName tpch_text_20.supplier -outputTableName tpch_parquet.supplier > temp.log
-inputTableName tpch_text_20.partsupp -outputTableName tpch_parquet.partsupp > temp.log
-inputTableName tpch_text_20.orders -outputTableName tpch_parquet.orders > temp.log
-inputTableName tpch_text_20.customer -outputTableName tpch_parquet.customer > temp.log
-inputTableName tpch_text_20.lineitem -outputTableName tpch_parquet.lineitem > temp.log


# Running scripts to test datatypes in kudu
spark-submit --master yarn-client \
--executor-memory 1512m \
--packages org.apache.kudu:kudu-spark_2.10:1.4.0 \
--class com.clairvoyant.practise.sparkkudu.TestKuduDatatypes \
 sparkkudu.jar 

No support for type Decimal, Date, Array, Map type
Did support Varchar ...? Yes converts it to String

CREATE EXTERNAL TABLE IF NOT EXISTS test_datatypes.kudu_varchar STORED AS KUDU TBLPROPERTIES('kudu.table_name'='table_var_varchar');


# Run Analytical queries
TODO :

http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-2/
why yarn-client works?
Load to HDFS
Parquet is working .. csv ?????/

# Running queries to measure insert, update, ..

# measure random access times:
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu --random_access
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_32 --random_access
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_4 --random_access
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_parquet --random_access

# creating backup tables for update, upsert, insert and delete
create table customer_backup 
primary key (`c_custkey`)
partition by hash(`c_custkey`) partitions 32
stored as kudu
as select * from customer;

# measure updates
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_4 --update
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu --update
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_32 --update

# measure inserts
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_4 --insert
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu --insert
python run_kudu_queries.py ip-10-0-0-76.ec2.internal tpch_kudu_32 --insert



