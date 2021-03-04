#!/bin/bash

set -u -e

curl -X DELETE \
  --cacert ../truststore.pem \
  https://superUser:superUser@vm5:8083/connectors/replicator
