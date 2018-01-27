#!/bin/bash

VOLUMES=(
    "acme_nexus"
    "acme_jenkins"
    "acme_docker_registry"
    )

echo "Creating Docker volumes..."

for volume in "${VOLUMES[@]}"
do
   docker volume create ${volume}
   echo "Created Docker volume ${volume}"
done

echo "All Docker volumes created"
