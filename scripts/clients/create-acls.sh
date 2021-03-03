kafka-acls \
 --bootstrap-server vm1:9091 \
 --command-config client.properties \
 --add --allow-principal User:alice --allow-principal User:fred --allow-host host-1 \
 --allow-host host-2 --operation read --operation write --topic finance-topic

