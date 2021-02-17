#!/bin/bash

set -u -e

curl -X POST \
  --cacert truststore.pem \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d @hana-sink-test.json \
  https://superUser:superUser@vm5:8083/connectors 


