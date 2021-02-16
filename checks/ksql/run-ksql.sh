#!/bin/bash

set -u -e 

USER=benedikt
NODE=vm5
ZONE=us-central1-a
BOOTSTRAP_SERVERS=vm1:9091,vm2:9091,vm3:9091

export KSQL_LOG4J_OPTS="-Dlog4j.configuration=file:log4j-file.properties"

ksql \
  --user superUser \
  --password superUser \
  --config-file ksql-cli.properties \
  https://vm5:8088

