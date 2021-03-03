#!/bin/bash

set -e -u 

function create-node {
  name=$1
  size=$4
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
    --boot-disk-size=$size \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=boot-disk \
    --tags $name \
    --reservation-affinity=any
}

create-node vm1 us-central1-a n2-standard-4 200GB
create-node vm2 us-central1-a n2-standard-4 200GB
create-node vm3 us-central1-a n2-standard-4 200GB
create-node vm4 us-central1-a n2-standard-4 200GB
create-node vm5 us-central1-a n2-standard-4 200GB
create-node vm6 us-central1-a n2-standard-4 200GB
create-node vm7 us-central1-a n2-standard-4 200GB
