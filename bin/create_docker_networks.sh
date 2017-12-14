#!/bin/bash

NETWORKS=("acme")

echo "Creating Docker networks..."

for network in "${NETWORKS[@]}"
do
   docker network create ${network}
   echo "Created Docker network ${network}"
done

echo "All Docker networks created"
