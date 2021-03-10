#!/bin/bash

set -u -e

for vm in vm4 vm5; do
  curl --cacert ../truststore.pem \
    https://superUser:superUser@${vm}:8083/WorkerMetrics/replicator
done

