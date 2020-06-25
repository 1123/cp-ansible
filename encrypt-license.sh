#!/bin/bash
# Run this script, and then insert the result into the properties section of the kafka_broker in hosts.yml
ansible-vault encrypt_string \
  --vault-id benedikt@prompt 'theLienseKeyGoesHere' \
  --name 'confluent.license'
