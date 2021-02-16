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
  ${USER}@${NODE}:/tmp/kafka_connect.truststore.jks ./truststore.jks

keytool -importkeystore -srckeystore truststore.jks -destkeystore truststore.p12 -srcstoretype JKS -deststoretype PKCS12
openssl pkcs12 -in truststore.p12 -out truststore.pem


