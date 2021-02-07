#!/bin/bash

set -e -u 

function create-node {
  name=benedikt-ansible-$1
  gcloud beta compute \
    --project=solutionsarchitect-01 instances create $name \
    --zone=$2 \
    --machine-type=$3 \
    --subnet=default \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --service-account=391245638390-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --image=centos-7-v20200205 \
    --image-project=centos-cloud \
    --boot-disk-size=50GB \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=boot-disk \
    --tags $name \
    --reservation-affinity=any
}

# create-node z-0 us-central1-a n1-standard-1
# create-node z-1 us-central1-a n1-standard-1
# create-node z-2 us-central1-a n1-standard-1
create-node b-0 us-central1-a n2-standard-2
create-node b-1 us-central1-a n2-standard-2
create-node b-2 us-central1-a n2-standard-2
# create-node c3 us-central1-a n2-standard-2
