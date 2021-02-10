ansible -i scram-rbac-tls.yml kafka_broker -a "sudo tail -n 50 /var/log/kafka/server.log"
