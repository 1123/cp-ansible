#!/bin/bash

set -e -u

USER=benedikt
NODE=vm5
ZONE=us-central1-a
BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

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
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --producer.config client-ssl.properties \
  --topic test
