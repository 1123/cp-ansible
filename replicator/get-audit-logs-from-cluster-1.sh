#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Consuming audit log events"
kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --consumer.config client-ssl.properties \
  --topic confluent-audit-log-events \
  --from-beginning | while read line; do echo $line | jq .; done
