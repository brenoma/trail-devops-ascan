#!/bin/bash

# TODO: Stuck in Kernel Upgrade!
sudo apt remove -y needrestart
sudo apt update
wait
sudo apt install nala -y && sudo nala upgrade -y

# Downloading and installing Docker.
sudo nala install -y \
	gnome-terminal \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo nala upgrade -y

wget "https://desktop.docker.com/linux/main/amd64/docker-desktop-4.15.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" -O /tmp/docker-desktop-4.15.0-amd64.deb
sudo nala install -y /tmp/docker-desktop-4.15.0-amd64.deb

# Configuring Docker to be enabled.
sudo systemctl --user enable docker-desktop
sudo systemctl --user start docker-desktop

sudo shutdown -r 1
