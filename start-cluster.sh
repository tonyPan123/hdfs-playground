#!/usr/bin/env bash

workspace=$(cd "$(dirname "${BASH_SOURCE-$0}")"; pwd)

$workspace/start-namenode.sh
$workspace/start-datanode.sh 2
$workspace/start-datanode.sh 3
