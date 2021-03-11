The scripts in this directory can be used to test cross cluster failover of consumers under high load when migrating between clusters.

See the documentation here: https://docs.confluent.io/platform/current/multi-dc-deployments/replicator/replicator-failover.html

How to run the demo:

* copy the truststore from a broker and convert to a format suitable for curl: `./copy-truststore-and-convert-to-pem-format.sh`
* start replicator: `cd connector && ./create-replicator-connector.sh`
* verify that the replicator is running: `cd connector && ./get-replicator-status.sh`
* produce some data into the source cluster in some other terminal: `./replicator/perf-rest/produce-to-cluster-1.sh`. You can adjust the size, number and throughput of messages in the script. 
* look at the connector metrics: `cd connector && ./get-replicator-metrics.sh`. In particular look at the reported latency and message lag. If the message lag remains 0, replicator can keep up with the load produced by the producer. 
* consume data from the primary cluster in a separate window using the script `perf-test/consume-original-messages.sh`
* watch the consumer offsets being committed to the source cluster (`read-consumer-offsets-cluster-1.sh`) and to the sink cluster as well (`read-consumer-offsets-cluster-2.sh`)
* watch the consumer timestamps being written to the source cluster (`get-consumer-timestamps-from-cluster-1.sh`). Consumer timestamps are used by replicator to do the consumer offset translation.
* stop the consumer on the origin cluster
* start the consumer on the destination cluster (`consume-replicated-messages.sh`). Notice that the offset committing on the source cluster has stopped, but the offset commits on the sink cluster continue -- they are now done directly by the consumer that has migrated to the destination cluster. 
* Failing back essentially works in the same way, and requires a replicator for the reverse direction. 
