#!/bin/bash

set -e -u


BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

kafka-producer-perf-test \
  --throughput 100 \
  --record-size 548576 \
  --num-records 20000 \
  --topic test \
  --producer.config producer-ssl.properties

