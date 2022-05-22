#!/usr/bin/env bash

workspace=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

SRC=$workspace/hadoop
HADOOP_HOME=$SRC/hadoop-dist/target/hadoop-3.0.0-alpha3-SNAPSHOT

HADOOP_HOME=$HADOOP_HOME \
HADOOP_CONF_DIR=$workspace/conf-1 \
HADOOP_PID_DIR=$workspace/logs-1 \
HADOOP_LOG_DIR=$workspace/logs-1 \
$HADOOP_HOME/bin/hdfs --daemon stop namenode
