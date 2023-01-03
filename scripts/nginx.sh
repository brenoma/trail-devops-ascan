#!/bin/bash

# Sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# Install nginx
apt-get update
apt-get -y install nginx

# Start nginx service
service nginx start