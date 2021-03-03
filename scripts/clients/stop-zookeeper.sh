#!/bin/bash

set -e -u

gcloud compute ssh \
  --zone us-central1-a vm$1 \
  --command 'sudo systemctl stop confluent-zookeeper.service'
