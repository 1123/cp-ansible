#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"
export CLASSPATH=/usr/share/java/kafka-connect-replicator/timestamp-interceptor-6.1.0.jar

echo "Consuming data from topic test"
kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --consumer.config consumer-with-interceptor.properties \
  --topic test \
  --from-beginning 
