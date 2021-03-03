#!/bin/bash

set -u -e

rm -f ~/.ssh/known_hosts
export ANSIBLE_HOST_KEY_CHECKING=false
ansible-playbook -i cluster-1.yml all.yml --tags=zookeeper
ansible-playbook -i cluster-1.yml all.yml --tags=kafka_broker
ansible-playbook -i cluster-1.yml all.yml --tags=schema_registry
ansible-playbook -i cluster-1.yml all.yml --tags=kafka_connect
ansible-playbook -i cluster-1.yml all.yml --tags=control_center
