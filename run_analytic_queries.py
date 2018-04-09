# resource http://blog.cloudera.com/blog/2014/04/a-new-python-client-for-impala/
# setup and code https://github.com/cloudera/impyla

import impala.dbapi
import os
import re
from time import time
import logging
import pyhs2
import argparse

# Reset values based on usage
DEFAULT_QUERY_PATH = ''
DEFAULT_DATABASE = 'default'
DEFAULT_HOST = 'localhost';

def setup_usage():
    parser = argparse.ArgumentParser(description="Program to run benchmark queries")
    parser.add_argument('master_host', metavar='master_host', type=str, nargs='?', help="Host ip for master node.")
    parser.add_argument('database_name', metavar='database_name', type=str, nargs='?',
                        help='database name to use')
    parser.add_argument('query_path', metavar='query_path', type=str, nargs='?',
                        help='path to folder with sql files to run')
    parser.add_argument("--hive", help="Set if you want to run hive queries. Default is impala queries",
                        action="store_true")

    args = parser.parse_args()
    return args


def setup_logger():
    lgr = logging.getLogger('benchmark')
    hdlr = logging.FileHandler('benchmark.log')
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    hdlr.setFormatter(formatter)
    lgr.addHandler(hdlr)
    lgr.setLevel(logging.INFO)
    return lgr


def get_sql_files_in_dir(query_dir):
    file_names = [os.path.join(query_dir, f) for f in os.listdir(query_dir) if
                  os.path.isfile(os.path.join(query_dir, f)) and '.sql' in (os.path.splitext(f)[1])]
    return file_names

def get_query_in_file(filename):
    f = open(filename, "r")
    lines = f.readlines()
    q = ' '.join([re.sub('[\\t\\n]', '', line) for line in lines])
    query_list = q.split(';')
    f.close()
    return query_list


def get_impala_connection(master_host):
    c = impala.dbapi.connect(host=master_host, port=21050)
    return c


def get_hive_connection(master_host):
    c = pyhs2.connect(host=master_host, port=10000, authMechanism="PLAIN", user='cloudera', database='default')
    return c


def execute_queries(cur, sql_files):
    for count in range(0, len(sql_files)):
        file_name = sql_files[count]
        querys = get_query_in_file(file_name)
        start_time = time()
        try:
            for query in querys:
                if query != '':
                    cur.execute(query)
            end_time = time()
            time_taken = end_time - start_time  # time_taken is in seconds
            # write result to log
            logger.info("Query in " + file_name + ": Time Taken(" + str(time_taken) + ")")
        except Exception as e:
            logger.error("Query in " + file_name + ": Error in running.")
            logger.error(e.message)


if __name__ == "__main__":
    prog_args = setup_usage()
    logger = setup_logger()
    database = DEFAULT_DATABASE
    query_path = DEFAULT_QUERY_PATH
    master_host = DEFAULT_HOST

    if prog_args.hive:
        logger.info("Running queries via hive")
        conn = get_hive_connection()
        cur = conn.cursor()

    if prog_args.database_name is not None:
        database = prog_args.database_name

    if prog_args.query_path is not None:
        query_path = prog_args.query_path
    else:
        logger.error("No Query Path Provided. Exiting")
        exit(1)

    if prog_args.master_host is not None:
        master_host = prog_args.master_host

    # Get DB Connections
    conn = get_impala_connection(master_host)
    cur = conn.cursor(master_host)

    # read queries from a folder
    sql_files = get_sql_files_in_dir(query_path)

    # if impala then invalidate metadata
    if prog_args.hive is False:
        cur.execute("invalidate metadata")

    # use the database specified
    try:
        cur.execute("use " + database)
        logger.info("Using Database: "+database)
    except Exception as e:
        logger.error("Error while using database: "+database)
        raise

    # execute the queries
    execute_queries(cur, sql_files)
