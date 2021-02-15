#!/bin/bash

set -e -u 

function list-nodes {
  gcloud beta compute \
    --project=solutionsarchitect-01 instances list \
    --zones=us-central1-a | grep vm
}

list-nodes 
