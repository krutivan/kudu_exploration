
import impala.dbapi
import os
import re
from time import time
import logging
import pyhs2
import argparse
import random

# Reset values based on usage
DEFAULT_QUERY_PATH = ''
DEFAULT_DATABASE = 'default'
DEFAULT_HOST = 'localhost';


def setup_usage():
    parser = argparse.ArgumentParser(description="Program to measure update, upsert, insert and delete times")
    parser.add_argument('master_host', metavar='master_host', type=str, nargs='?', help="Host ip for master node.")
    parser.add_argument('database_name', metavar='database_name', type=str, nargs='?',
                        help='database name to use')
    parser.add_argument("--random_access", help="Set if want to measure data select times",
                        action="store_true")
    parser.add_argument("--update", help="Set if want to measure update times",
                        action="store_true")
    parser.add_argument("--delete", help="Set if want to measure delete times",
                        action="store_true")
    parser.add_argument("--insert", help="Set if want to measure insert times",
                        action="store_true")
    args = parser.parse_args()
    return args


def setup_logger():
    lgr = logging.getLogger('kudu_queries')
    hdlr = logging.FileHandler('kudu_queries.log')
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    hdlr.setFormatter(formatter)
    lgr.addHandler(hdlr)
    lgr.setLevel(logging.INFO)
    return lgr


def get_impala_connection(master_host):
    c = impala.dbapi.connect(host=master_host, port=21050)
    return c


def execute_random_access(cur):
    query = "select min(c_custkey) from customer"
    cur.execute(query)
    min_id= cur.fetchall()[0][0]
    query = "select max(c_custkey) from customer"
    cur.execute(query)
    max_id = cur.fetchall()[0][0]
    start_time = time()
    for i in range(0,1000):
        rand_id = random.randint(min_id, max_id)
        query = "select * from customer where c_custkey={0}".format(rand_id)
        cur.execute(query)
        output = cur.fetchall()
    end_time = time()
    time_taken = end_time - start_time
    logger.info("Query Time Taken for 1000 id's is {0}".format(time_taken))


def update(cur):
    query = "select min(c_custkey) from customer"
    cur.execute(query)
    min_id= cur.fetchall()[0][0]
    query = "select max(c_custkey) from customer"
    cur.execute(query)
    max_id = cur.fetchall()[0][0]
    start_time = time()
    for i in range(0,1000):
        rand_id = random.randint(min_id, max_id)
        query = "UPDATE customer_backup SET c_comment=\"Random Comment\" where c_custkey = {0};".format(rand_id)
        cur.execute(query)
    end_time = time()
    time_taken = end_time - start_time
    logger.info("Query Time Taken to UPDATE 1000 id's is {0}".format(time_taken))


def execute_insert(cur):
    query = "select max(c_custkey) from customer"
    cur.execute(query)
    max_id = cur.fetchall()[0][0]
    start_time = time()
    for i in range(0, 1000):
        rand_id = random.randint(max_id, max_id+10000)
        query = "INSERT into customer_backup(c_custkey, c_comment) values({0},\"Random_Comment\")".format(rand_id)
        cur.execute(query)
    end_time = time()
    time_taken = end_time - start_time
    logger.info("Query Time Taken to INSERT 1000 id's is {0}".format(time_taken))

def execute_delete(cur):
    query = "select max(c_custkey) from customer"
    cur.execute(query)
    max_id = cur.fetchall()[0][0]
    start_time = time()
    for i in range(0, 1000):
        rand_id = random.randint(max_id, max_id)
        query = "DELETE from customer_backup where c_custkey={0}".format(rand_id)
        cur.execute(query)
    end_time = time()
    time_taken = end_time - start_time
    logger.info("Query Time Taken to Delete 1000 id's is {0}".format(time_taken))


if __name__ == "__main__":
    prog_args = setup_usage()
    logger = setup_logger()
    database = DEFAULT_DATABASE
    query_path = DEFAULT_QUERY_PATH
    master_host = DEFAULT_HOST

    if prog_args.master_host is not None:
        master_host = prog_args.master_host

    if prog_args.database_name is not None:
        database = prog_args.database_name

    # Get DB Connections
    conn = get_impala_connection(master_host)
    cur = conn.cursor(master_host)
    cur.execute("invalidate metadata")

    # use the database specified
    try:
        cur.execute("use " + database)
        logger.info("Using Database: " + database)
    except Exception as e:
        logger.error("Error while using database: " + database)
        raise

    if prog_args.random_access:
        execute_random_access(cur)
    if prog_args.update:
        update(cur)
    if prog_args.insert:
        execute_insert(cur)
    if prog_args.delete:
        execute_delete(cur)


