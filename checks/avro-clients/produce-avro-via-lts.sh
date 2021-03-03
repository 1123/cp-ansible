#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Producing sample data about orders in avro format"
while true; do
  echo '{"number": 2343434, "date": 1596490462, "shipping_address": "456 Everett St, Palo Alto, 94301 CA, USA", "subtotal": 99.0, "shipping_cost": 0.0, "tax": 8.91, "grand_total": 107.91}'
  sleep 1 
done | kafka-avro-console-producer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --producer-property sasl.mechanism=SCRAM-SHA-512 \
  --producer-property security.protocol=SASL_SSL \
  --producer-property sasl.jaas.config='org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="admin-secret";' \
  --producer-property ssl.truststore.location=truststore.jks \
  --producer-property ssl.truststore.password=confluenttruststorepass \
  --property value.schema="$(< order_detail.avsc)" \
  --property schema.registry.url=https://vm7:8081 \
  --property schema.registry.ssl.truststore.location=truststore.jks \
  --property schema.registry.ssl.truststore.password=confluenttruststorepass \
  --property basic.auth.credentials.source=USER_INFO \
  --property basic.auth.user.info=superUser:superUser \
  --topic test-avro

