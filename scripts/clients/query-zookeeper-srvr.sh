#!/bin/bash

set -e -u 

for ZK in benedikt-ansible-z-0 benedikt-ansible-z-1 benedikt-ansible-z-2; do
  echo "querying ZK $ZK"
  echo srvr | timeout 2 nc $ZK 2181 || echo "could not reach $ZK"
done
