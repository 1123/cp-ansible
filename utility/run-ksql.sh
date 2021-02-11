#!/bin/bash

set -u -e 

USER=benedikt
NODE=benedikt-ansible-c-0
ZONE=us-central1-a
BOOTSTRAP_SERVERS=benedikt-ansible-b-0:9091,benedikt-ansible-b-1:9091,benedikt-ansible-b-2:9091

echo "Copying generated truststore from ${NODE}"
gcloud compute ssh ${USER}@${NODE} \
  --zone ${ZONE} \
  --command "sudo cp /var/ssl/private/kafka_connect.truststore.jks /tmp"
gcloud compute ssh ${USER}@${NODE} \
  --zone ${ZONE} \
  --command "sudo chmod a+r /tmp/kafka_connect.truststore.jks"
gcloud compute scp \
  --zone ${ZONE} \
  ${USER}@${NODE}:/tmp/kafka_connect.truststore.jks .

export KSQL_LOG4J_OPTS="-Dlog4j.configuration=file:log4j-file.properties"

ksql \
  --user superUser \
  --password superUser \
  --config-file ksql-cli.properties \
  https://benedikt-ansible-c-0:8088

