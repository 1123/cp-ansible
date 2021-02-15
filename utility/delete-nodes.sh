#!/bin/bash

set -u 

function delete-node {
  name=$1
  gcloud beta compute \
    --project=solutionsarchitect-01 instances delete $name 
}

for vm in vm1 vm2 vm3 vm4 vm5 vm6 vm7; do 
  delete-node $vm
done

