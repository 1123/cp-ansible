#!/bin/bash

set -u -e

curl -X POST \
  --cacert truststore.pem \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d @${1} \
  https://superUser:superUser@vm5:8083/connectors 


