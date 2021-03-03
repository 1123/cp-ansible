ansible -i scram-rbac-tls.yml kafka_broker -a "sudo systemctl status confluent-zookeeper.service"
