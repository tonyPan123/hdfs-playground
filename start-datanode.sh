#!/usr/bin/env bash

workspace=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

if [ $1 -ne 2 ] && [ $1 -ne 3 ]  && [ $1 -ne 4 ]  && [ $1 -ne 5 ]; then
  echo "exit due to wrong argument"
  exit 1
fi

SRC=$workspace/hadoop
HADOOP_HOME=$SRC/hadoop-dist/target/hadoop-3.0.0-alpha3-SNAPSHOT
#BYTEMAN_HOME=$HOME/mcgray-detected-bugs/byteman

HADOOP_HOME=$HADOOP_HOME \
HADOOP_CONF_DIR=$workspace/conf-$1 \
HADOOP_PID_DIR=$workspace/logs-$1 \
HADOOP_LOG_DIR=$workspace/logs-$1 \
HADOOP_OPTS="$HADOOP_OPTS $BM_JVM_OPTS" \
BM_JVM_OPTS="$BM_JVM_OPTS" \
DN_BM_JVM_OPTS_SET=1 \
$HADOOP_HOME/bin/hdfs --daemon start datanode
