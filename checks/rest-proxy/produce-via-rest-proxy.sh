#!/bin/bash 

TOPIC=rest-proxy-test
URL=https://superUser:superUser@vm7:8082

curl \
  -X POST \
  --cacert truststore.pem \
  -H "Content-Type: application/vnd.kafka.json.v2+json" \
  --data '{"records":[{"value":{"foo":"bar"}}]}' \
  https://superUser:superUser@vm7:8082/topics/$TOPIC
