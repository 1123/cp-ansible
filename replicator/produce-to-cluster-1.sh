#!/bin/bash

set -e -u


BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Producing some data"
while true; do
  echo $(date)
  sleep 1 
done | kafka-console-producer \
  --bootstrap-server ${BOOTSTRAP_SERVERS} \
  --producer.config client-ssl.properties \
  --topic test

