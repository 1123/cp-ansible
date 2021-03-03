#!/bin/bash

set -e -u 

for ZK in vm1 vm2 vm3; do
  echo "querying ZK $ZK"
  echo srvr | timeout 2 nc $ZK 2181 || echo "could not reach $ZK"
done
