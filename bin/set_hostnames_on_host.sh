#!/bin/bash

echo "Creating hostname entries..."

HOST_IP=127.0.0.1

echo "${HOST_IP} \
      acme.com \
      bank.acme.com \
      loan.bank.acme.com \
      ldap.acme.com \
      haproxy.acme.com \
      jenkins.acme.com \
      nexus.acme.com \
      docker.acme.com \
      docker-registry.acme.com \
      docker-hub.acme.com \
      shipyard.acme.com \
      config.acme.com \
      kafka01.acme.com \
      zookeeper01.acme.com" >> /etc/hosts

echo "All hostname entries created"
