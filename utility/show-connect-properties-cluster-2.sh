ansible \
  -i cluster-2.yml kafka_connect \
  -a "sudo cat /etc/kafka/connect-distributed.properties"
