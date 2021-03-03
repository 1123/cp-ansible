ansible -i scram-rbac-tls.yml kafka_connect -a "sudo systemctl restart confluent-kafka-connect.service"
