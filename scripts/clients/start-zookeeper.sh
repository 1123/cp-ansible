#!/bin/bash

set -u -e

gcloud compute ssh \
  --zone us-central1-a vm$1 \
  --command 'sudo systemctl start confluent-zookeeper.service'
