#!/usr/bin/env bash

workspace=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

if [ $1 -ne 2 ] && [ $1 -ne 3 ] && [ $1 -ne 4 ]; then
  echo "exit due to wrong argument"
  exit 1
fi

SRC=$workspace/hadoop
HADOOP_HOME=$SRC/hadoop-dist/target/hadoop-3.0.0-alpha3-SNAPSHOT

HADOOP_HOME=$HADOOP_HOME \
HADOOP_CONF_DIR=$workspace/conf-$1 \
HADOOP_PID_DIR=$workspace/logs-$1 \
HADOOP_LOG_DIR=$workspace/logs-$1 \
$HADOOP_HOME/bin/hdfs --daemon stop datanode
