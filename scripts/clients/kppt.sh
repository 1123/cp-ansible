#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=benedikt-ansible-b-0:9091,benedikt-ansible-b-1:9091,benedikt-ansible-b-1:9091

kafka-producer-perf-test \
  --producer.config client.properties \
  --topic test \
  --record-size 1024 \
  --num-records 100000 \
  --throughput -1 \
  --producer-props bootstrap.servers=$BOOTSTRAP_SERVERS acks=all
