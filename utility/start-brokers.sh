ansible -i scram-rbac.yml kafka_broker -a "sudo systemctl start confluent-server.service"
