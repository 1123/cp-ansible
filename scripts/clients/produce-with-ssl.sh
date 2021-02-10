#!/bin/bash

set -e -u

USER=benedikt
NODE=benedikt-ansible-c-0
ZONE=us-central1-a

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

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:/home/benedikt/cp-ansible/scripts/clients/tools-log4j.properties"

echo "Producing some data"
while true; do
  echo $(date)
  sleep 1 
done | kafka-console-producer \
  --bootstrap-server benedikt-ansible-b-0:9091 \
  --producer.config client-ssl.properties \
  --topic test
