#!/bin/bash

set -e -u 

gcloud beta compute \
  --project=solutionsarchitect-01 instances delete \
    benedikt-ansible-b-0 \
    benedikt-ansible-b-1 \
    benedikt-ansible-b-2 \
    benedikt-ansible-z-0 \
    benedikt-ansible-z-1 \
    benedikt-ansible-z-2 \
    benedikt-ansible-c-0 \
    benedikt-ansible-r-0 \
  --zone=us-central1-a --quiet
