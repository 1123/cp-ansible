#!/bin/bash

set -e -u


BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

kafka-producer-perf-test \
  --throughput 10 \
  --record-size 54 \
  --num-records 200000 \
  --topic test \
  --producer.config producer-ssl.properties

