#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package index
sudo apt-get update

# Install prerequisites
sudo apt-get install -y ca-certificates curl

# Create the directory for Docker's GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Set appropriate permissions for the key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker's repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again to include Docker's repository
sudo apt-get update

# Install Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin

# Print completion message
echo "Docker installation completed successfully!"

