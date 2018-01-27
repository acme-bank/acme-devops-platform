#!/bin/bash

KAFKA_NODE=acme_kafka_01
ZOOKEEPER_NODES=acme_zookeeper_01

TOPICS=(
    "registered-loans"
    "validated-loans"
    "enriched-loans"
    "pending-loans"
    "augmented-loans"
    "entitled-loans"
    "rejected-loans"
    )

PARTITIONS=1
REPLICATION_FACTOR=1

if ! docker ps | grep -q "${KAFKA_NODE}"; then
    echo "Kafka Docker container does not exist, cannot continue"
    exit 1
fi

echo "Creating Kafka topics..."

for topic in "${TOPICS[@]}"
do
    if docker exec -it ${KAFKA_NODE} ./bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_NODES} | grep -q "${topic}"; then
        echo -e "\t- Kafka topic ${topic} already exists"
    else
        docker exec -it ${KAFKA_NODE} ./bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_NODES} --partitions ${PARTITIONS} --replication-factor ${REPLICATION_FACTOR} --topic ${topic}
        echo -e "\t- Created Kafka topic ${topic} with partitions ${PARTITIONS} and replication factor ${REPLICATION_FACTOR}"
    fi
done

echo "All Kafka topics created"
