#!/bin/bash

set -e -u 

gcloud beta compute \
  --project=solutionsarchitect-01 instances delete \
    benedikt-ansible-benedikt-b-0 \
    benedikt-ansible-benedikt-b-2 \
    benedikt-ansible-benedikt-c-0 \
  --zone=us-central1-a --quiet
