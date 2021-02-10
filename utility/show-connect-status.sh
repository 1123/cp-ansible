ansible \
  -i scram-rbac-tls.yml kafka_connect \
  -a "sudo systemctl status confluent-kafka-connect.service"
