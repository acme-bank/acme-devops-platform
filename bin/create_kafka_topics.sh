#!/bin/bash

if [ -z "${ZOOKEEPER_NODES}" ]; then
   echo "No ZOOKEEPER_NODES variable defined"
   exit 1
fi

TOPICS=("registered-loans" "validated-loans" "enriched-loans" "pending-loans" "augmented-loans" "entitled-loans" "rejected-loans")

PARTITIONS=1
REPLICATION_FACTOR=1

echo "Creating Kafka topics..."

for topic in "${TOPICS[@]}"
do
   docker exec -it acme_kafka_01 ./bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_NODES} --partitions ${PARTITIONS} --replication-factor ${REPLICATION_FACTOR} --topic ${topic}
   echo "Created Kafka topic ${topic} with partitions ${PARTITIONS} and replication factor ${REPLICATION_FACTOR}"
done

echo "All Kafka topics created"
