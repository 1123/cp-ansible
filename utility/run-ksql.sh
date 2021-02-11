#!/bin/bash

set -u -e 

export KSQL_LOG4J_OPTS="-Dlog4j.configuration=file:log4j-file.properties"

ksql \
  --user superUser \
  --password superUser \
  https://benedikt-ansible-c-0:8088

# --config-file ksql-cli.properties \
