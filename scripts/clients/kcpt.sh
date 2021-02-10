#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=benedikt-ansible-b-0:9091,benedikt-ansible-b-1:9091,benedikt-ansible-b-1:9091

kafka-consumer-perf-test \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --consumer.config client.properties \
  --topic test \
  --messages 100000
