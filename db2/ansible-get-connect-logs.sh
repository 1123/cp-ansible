ansible -i ../scram-rbac-tls.yml kafka_connect -a "sudo tail -n 100 /var/log/kafka/connect-distributed.log"
