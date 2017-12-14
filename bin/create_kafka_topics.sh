#!/bin/bash

KAFKA_NODE=acme_kafka_01
ZOOKEEPER_NODES=acme_zookeeper_01

TOPICS=("registered-loans" "validated-loans" "enriched-loans" "pending-loans" "augmented-loans" "entitled-loans" "rejected-loans")

PARTITIONS=1
REPLICATION_FACTOR=1

echo "Creating Kafka topics..."

for topic in "${TOPICS[@]}"
do
   docker exec -it ${KAFKA_NODE} ./bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_NODES} --partitions ${PARTITIONS} --replication-factor ${REPLICATION_FACTOR} --topic ${topic}
   echo "Created Kafka topic ${topic} with partitions ${PARTITIONS} and replication factor ${REPLICATION_FACTOR}"
done

echo "All Kafka topics created"
