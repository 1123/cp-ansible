ansible -i scram-rbac-tls.yml kafka_broker -a "sudo systemctl start confluent-server.service"
