#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm4:9091,vm5:9091,vm6:9091

export CLASSPATH=/usr/share/java/kafka-connect-replicator/timestamp-interceptor-6.1.0.jar
export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Consuming data from replicated topic"
kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --consumer.config consumer-ssl.properties \
  --topic test | cut -c 10
