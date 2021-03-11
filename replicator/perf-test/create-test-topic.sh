#!/bin/bash

set -e -u


BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

kafka-topics \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --create --topic test --partitions 12 --replication-factor 3 \
  --command-config producer-ssl.properties

