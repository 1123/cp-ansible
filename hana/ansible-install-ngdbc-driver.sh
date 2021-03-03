ansible -i ../scram-rbac-tls.yml kafka_connect -a "sudo -u cp-kafka-connect curl https://repo1.maven.org/maven2/com/sap/cloud/db/jdbc/ngdbc/2.7.11/ngdbc-2.7.11.jar -o /usr/share/java/confluentinc-kafka-connect-jdbc/lib/ngdbc-2.7.11.jar"
ansible -i ../scram-rbac-tls.yml kafka_connect -a "sudo systemctl restart confluent-kafka-connect.service"
