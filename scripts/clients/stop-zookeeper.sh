#!/bin/bash

set -e -u

gcloud compute ssh \
  --zone us-central1-a benedikt-ansible-z-$1 \
  --command 'sudo systemctl stop confluent-zookeeper.service'
