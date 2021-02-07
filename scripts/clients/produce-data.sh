#!/bin/bash

set -e -u 
BOOTSTRAP_SERVERS=benedikt-ansible-b-0:9091,benedikt-ansible-b-1:9091,benedikt-ansible-b-1:9091

while true; do
  echo $(date) 
  sleep 1
done | kafka-console-producer \
    --producer.config client.properties \
    --bootstrap-server $BOOTSTRAP_SERVERS \
    --topic $1
