#!/bin/bash

# Update dependencies
sudo yum update -y

# Download docker
sudo amazon-linux-extras install docker -y

# Start docker service
sudo service docker start

# Add user to the group to run docker commands without sudo.
sudo usermod -a -G docker ubuntu

# Make docker enabled when system is rebooted.
sudo systemctl --user enable docker
sudo systemctl --user start docker