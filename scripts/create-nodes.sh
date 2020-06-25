#!/bin/bash

set -e -u 

function create-node {
  gcloud beta compute \
    --project=solutionsarchitect-01 instances create benedikt-ansible-$1 \
    --zone=$2 \
    --machine-type=n1-standard-1 \
    --subnet=default \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --service-account=391245638390-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --image=centos-7-v20200205 \
    --image-project=centos-cloud \
    --boot-disk-size=50GB \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=benedikt-mbb-test \
    --tags benedikt-ansible \
    --reservation-affinity=any
}

create-node z-0 us-central1-a
create-node z-1 us-central1-a
create-node z-2 us-central1-a
create-node b-0 us-central1-a
create-node b-1 us-central1-a
create-node b-2 us-central1-a
create-node c-0 us-central1-a
create-node r-0 us-central1-a
