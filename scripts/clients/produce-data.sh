#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm2:9091

while true; do
  echo $(date) 
  sleep 1
done | kafka-console-producer \
    --producer.config client.properties \
    --bootstrap-server $BOOTSTRAP_SERVERS \
    --topic $1
