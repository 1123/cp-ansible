#!/bin/bash

set -e -u

USER=benedikt
NODE=vm1
ZONE=us-central1-a

rm -f truststore.*

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

keytool \
  -importkeystore \
  -srckeystore truststore.jks \
  -destkeystore truststore.p12 \
  -srcstoretype JKS \
  -deststoretype PKCS12 \
  -deststorepass confluenttruststorepass \
  -srcstorepass confluenttruststorepass \
  -noprompt
openssl pkcs12 \
  -passin pass:confluenttruststorepass \
  -in truststore.p12 \
  -out truststore.pem

