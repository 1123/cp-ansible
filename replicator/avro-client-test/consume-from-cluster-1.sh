#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

echo "Consuming order data in avro format"
kafka-avro-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS}\
  --consumer-property security.protocol=SASL_SSL \
  --consumer-property sasl.mechanism=SCRAM-SHA-512 \
  --consumer-property sasl.jaas.config='org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="admin-secret";' \
  --consumer-property ssl.truststore.location=truststore.jks \
  --consumer-property ssl.truststore.password=confluenttruststorepass \
  --property schema.registry.url=https://vm3:8081 \
  --property schema.registry.ssl.truststore.location=truststore.jks \
  --property schema.registry.ssl.truststore.password=confluenttruststorepass \
  --property basic.auth.credentials.source=USER_INFO \
  --property basic.auth.user.info=superUser:superUser \
  --topic test-avro \
  --from-beginning
