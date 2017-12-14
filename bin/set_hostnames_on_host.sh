#!/bin/bash

echo "Creating hostname entries..."

echo "127.0.0.1	\
      acme.com \
      bank.acme.com \
      loan.bank.acme.com \
      ldap.acme.com \
      proxy.acme.com \
      jenkins.acme.com \
      nexus.acme.com \
      config.acme.com \
      kafka01.acme.com \
      zookeeper01.acme.com" >> /etc/hosts

echo "All hostname entries created"
