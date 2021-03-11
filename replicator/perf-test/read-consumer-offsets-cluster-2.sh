#!/bin/bash

set -e -u

BOOTSTRAP_SERVERS=vm4:9091,vm5:9091,vm6:9091

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:./tools-log4j.properties"

kafka-console-consumer \
  --bootstrap-server ${BOOTSTRAP_SERVERS} \
  --consumer.config consumer-timestamps-consumer.properties \
  --topic '__consumer_offsets' \
  --property print.key=true \
  --property key.deserializer=io.confluent.connect.replicator.offsets.GroupTopicPartitionDeserializer \
  --property value.deserializer=io.confluent.connect.replicator.offsets.TimestampAndDeltaDeserializer \
  --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" 


