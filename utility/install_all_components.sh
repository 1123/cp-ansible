#!/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook -i scram-rbac.yml all.yml --tags=zookeeper
ansible-playbook -i scram-rbac.yml all.yml --tags=kafka_broker
ansible-playbook -i scram-rbac.yml all.yml --tags=schema_registry
ansible-playbook -i scram-rbac.yml all.yml --tags=kafka_rest
ansible-playbook -i scram-rbac.yml all.yml --tags=kafka_connect
ansible-playbook -i scram-rbac.yml all.yml --tags=ksql
ansible-playbook -i scram-rbac.yml all.yml --tags=control_center


