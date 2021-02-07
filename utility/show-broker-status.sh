ansible -i scram-rbac.yml kafka_broker -a "sudo systemctl status confluent-server.service"
