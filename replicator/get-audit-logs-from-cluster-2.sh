#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm4:9091,vm5:9091,vm6:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Consuming audit log events"
kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --consumer.config client-ssl.properties \
  --topic confluent-audit-log-events \
  --from-beginning 
