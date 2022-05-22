#!/usr/bin/env bash

workspace=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)
./setup.sh
./format.sh
./start-cluster.sh
./client.sh org.apache.hadoop.hdfs.NNBenchWithoutMR -operation createWrite -baseDir /benchmarks -numFiles 30 -blocksPerFile 160 -bytesPerBlock 10485760
./start-datanode.sh 4
./start-datanode.sh 5
./client_datanode.sh balancer -threshold 1
