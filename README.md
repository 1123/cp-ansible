## Modifications from the forked repository

This fork of the public cp-ansible repository inlcudes the following modifications: 

* scripts to bring up virtual machines for testing on GCP
* Adjusted monitoring infrastructure from https://github.com/jeanlouisboudart/kafka-platform-prometheus in the monitoring subfolder.
* An openldap container with preconfigured users to draw system users from in the openldap subdirectory. This has been incorporated from the cp-demo github repository.  
* An inventory file with TLS enabled for all components, SASL-Scram authentication enabled, LDAP authentication to the openldap container, RABC enabled, co-location of Zookeeper and Kafka and colocation of some other CP components. 
* A demo folder for exporting data to SAP HANA using the JDBC Sink connector in the hana subdirectory. A SAP Hana express container is brought up to showcase this. 
* A demo folder for importing data from DB2 via the Debezium CDC DB2 source connector in the db2 subdirectory. A DB2 docker container from the debezium project is run for the purpose of this demo. 
* Post installation checks for all major platform components (Kafka, Connect, KSQL, Rest Proxy) in the checks subdirectory. 

## Running the adjusted deployment

* Edit scram-rbac.yml to adjust ssh configuration at the top, and the virtual machine names (vm1, ..., vm7). 
* Run the openlap container on some host (can be the ansible installation host)
* adjust the URL to the openldap container within scram-rbac.yml to point to the host that is running the openldap docker image. 
* run the ansible scripts as documented on the Confluent Website -- see the link below. 

# CP-Ansible

## Introduction

Ansible provides a simple way to deploy, manage, and configure the Confluent Platform services. This repository provides playbooks and templates to easily spin up a Confluent Platform installation. Specifically this repository:

* Installs Confluent Platform packages.
* Starts services using systemd scripts.
* Provides configuration options for plaintext, SSL, SASL_SSL, and Kerberos.

The services that can be installed from this repository are:

* ZooKeeper
* Kafka
* Schema Registry
* REST Proxy
* Confluent Control Center
* Kafka Connect (distributed mode)
* KSQL Server

## Documentation

You can find the documentation for running CP-Ansible at https://docs.confluent.io/current/installation/cp-ansible/index.html.

You can find supported configuration variables in [VARIABLES.md](https://github.com/confluentinc/cp-ansible/blob/6.0.x/VARIABLES.md)

## Version Bumps

Use [bump2version](https://github.com/c4urself/bump2version) tool to bump versions in all the correct places.

## Contributing


If you would like to contribute to the CP-Ansible project, please refer to the [CONTRIBUTE.md](https://github.com/confluentinc/cp-ansible/blob/6.0.x/CONTRIBUTING.md)


## License

[Apache 2.0](https://github.com/confluentinc/cp-ansible/blob/6.0.x/LICENSE.md)
