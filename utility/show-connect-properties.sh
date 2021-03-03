ansible \
  -i cluster-1.yml kafka_connect \
  -a "sudo cat /etc/kafka/connect-distributed.properties"
