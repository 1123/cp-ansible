#!/bin/bash

set -e -u 

function delete-node {
  name=benedikt-ansible-$1
  gcloud beta compute \
    --project=solutionsarchitect-01 instances delete $name 
}

# delete-node z-0 us-central1-a n1-standard-1
#delete-node z-1 us-central1-a n1-standard-1
# delete-node z-2 us-central1-a n1-standard-1
delete-node b-0 us-central1-a n2-standard-2
delete-node b-1 us-central1-a n2-standard-2
delete-node b-2 us-central1-a n2-standard-2
# delete-node c3 us-central1-a n2-standard-2
