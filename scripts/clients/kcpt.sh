#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm2:9091

kafka-consumer-perf-test \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --consumer.config client.properties \
  --topic test \
  --messages 100000
