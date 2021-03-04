#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"
export CLASSPATH=/usr/share/java/kafka-connect-replicator/*

kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS} \
  --consumer.config consumer-timestamps-consumer.properties \
  --topic '__consumer_timestamps' \
  --property print.key=true \
  --property key.deserializer=io.confluent.connect.replicator.offsets.GroupTopicPartitionDeserializer \
  --property value.deserializer=io.confluent.connect.replicator.offsets.TimestampAndDeltaDeserializer \
  --from-beginning 
