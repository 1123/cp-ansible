#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm2:9091

kafka-producer-perf-test \
  --producer.config client.properties \
  --topic test \
  --record-size 1024 \
  --num-records 100000 \
  --throughput -1 \
  --producer-props bootstrap.servers=$BOOTSTRAP_SERVERS acks=all
