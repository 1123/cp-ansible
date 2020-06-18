kafka-console-producer \
  --producer.config client-sasl-scram.properties \
  --bootstrap-server benedikt-ansible-b-0:9093,benedikt-ansible-b-1:9093,benedikt-ansible-b-2:9093 \
  --topic test-topic
