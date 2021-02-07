ansible \
  -i scram-rbac.yml kafka_connect \
  -a "sudo systemctl status confluent-kafka-connect.service"
