#!/bin/bash

set -e

if [ "$(whoami)" != "root" ]; then
    echo "Must be root"
    exit 1
fi

HOST_IP="${1:-127.0.0.1}"

DOMAIN="${2:-acme.com}"

HOSTNAMES=(
    "${DOMAIN}"
    "bank.${DOMAIN}"
    "loan.bank.${DOMAIN}"
    "ldap.${DOMAIN}"
    "haproxy.${DOMAIN}"
    "jenkins.${DOMAIN}"
    "nexus.${DOMAIN}"
    "docker.${DOMAIN}"
    "docker-ui.${DOMAIN}"
    "shipyard.acme.com"
    "config.${DOMAIN}"
    "kafka01.${DOMAIN}"
    "zookeeper01.${DOMAIN}"
    )

echo "Creating hostname entries..."

for hostname in "${HOSTNAMES[@]}"
do
    if grep -q "\s${hostname}" /etc/hosts; then
        echo -e "\t- Hostname ${hostname} already exists"
    else
        echo -e "\t- Adding hostname ${hostname}"
        echo "${HOST_IP} ${hostname}" >> /etc/hosts
    fi
done

echo "All hostname entries created"
