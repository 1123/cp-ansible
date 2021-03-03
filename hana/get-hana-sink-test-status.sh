#!/bin/bash

set -u -e

curl --cacert truststore.pem \
  https://superUser:superUser@vm5:8083/connectors/hana-sink-test/status
