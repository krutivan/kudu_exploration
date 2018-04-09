

# A code to test if all hive datatypes are compatible to kudu and can all datatypes be imported into kudu.

DATATYPES=(TINYINT INT SMALLINT BIGINT STRING VARCHAR\(8\) FLOAT DOUBLE BOOLEAN DECIMAL\(8,8\) TIMESTAMP DATE BINARY ARRAY\<INT\> MAP\<INT,FLOAT\> UNIONTYPE\<FLOAT,BOOLEAN,STRING\>)
NAMES=(TINYINT INT SMALLINT BIGINT STRING VARCHAR FLOAT DOUBLE BOOLEAN DECIMAL TIMESTAMP DATE BINARY ARRAY MAP UNIONTYPE)

create_hive()
{
	count=0
	while [ $count -lt ${#DATATYPES[@]} ]
	do
		hive -e "create table if not exists test_datatypes.table_${NAMES[$count]}(id ${DATATYPES[$count]})"
		hive -e "create table if not exists test_datatypes.table_var_${NAMES[$count]}(id INT, var ${DATATYPES[$count]})"
		count=$(( $count + 1 ))
	done	
}

create_kudu()
{
	count=0
	while [ $count -lt ${#DATATYPES[@]} ]
	do
		impala-shell -q "INVALIDATE METADATA test_datatypes.table_${NAMES[$count]}"
		impala-shell -q "CREATE TABLE if not exists test_datatypes.kudu_${NAMES[$count]} PRIMARY KEY (id) PARTITION BY HASH(id) PARTITIONS 8 STORED AS KUDU AS SELECT id FROM test_datatypes.table_${NAMES[$count]}"
		impala-shell -q "INVALIDATE METADATA test_datatypes.table_var_${NAMES[$count]}"
		impala-shell -q "CREATE TABLE if not exists test_datatypes.kudu_var_${NAMES[$count]} PRIMARY KEY (id) PARTITION BY HASH(id) PARTITIONS 8 STORED AS KUDU AS SELECT * FROM test_datatypes.table_var_${NAMES[$count]}"
		count=$(( $count + 1 ))
	done
}

# setup
setup()
{
	hive -e 'create database if not exists test_datatypes'
}

# clean up hive and impala tables
clean_up()
{
	count=0
	while [ $count -lt ${#DATATYPES[@]} ]
	do
		hive -e "DROP TABLE IF EXISTS test_datatypes.table_${NAMES[$count]}"
		hive -e "DROP TABLE IF EXISTS test_datatypes.table_var_${NAMES[$count]}"
		impala-shell -q "DROP TABLE IF EXISTS test_datatypes.kudu_${NAMES[$count]}"
		impala-shell -q "DROP TABLE IF EXISTS test_datatypes.kudu_var_${NAMES[$count]}"
		count=$(( $count + 1 ))
	done
}

# clean up hive and impala tables
clean_up_backup()
{
	for i in "${DATATYPES[@]}"
	do
		hive -e "DROP TABLE IF EXISTS test_datatypes.table_$i"
		hive -e "DROP TABLE IF EXISTS test_datatypes.table_var_$i"
		impala-shell -q "DROP TABLE IF EXISTS test_datatypes.kudu_$i"
		impala-shell -q "DROP TABLE IF EXISTS test_datatypes.kudu_var_$i"
	done
}

count=0
while [ $count -lt ${#DATATYPES[@]} ]
do
	echo ${DATATYPES[$count]}
	echo "${NAMES[$count]}"
	count=$(( $count + 1 ))
done


if [[ $1 = '--create_hive' ]]
	then create_hive
elif [[ $1 = '--setup' ]]
	then setup
elif [[ $1 = '--create_kudu' ]]
	then create_kudu
elif [[ $1 = '--clean' ]]
	then clean_up
else 
	echo "sh test.sh [--create_hive or --setup or --create_kudu or --clean]"
fi
