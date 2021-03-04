ansible -i cluster-1.yml kafka_broker -a "sudo systemctl start confluent-server.service"
