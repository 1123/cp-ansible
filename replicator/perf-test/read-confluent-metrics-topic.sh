#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --topic _confluent-metrics \
  --property print.key=true \
  --property key.separator="-" \
  --consumer.config consumer-ssl.properties \
  --formatter io.confluent.metrics.reporter.ConfluentMetricsFormatter

