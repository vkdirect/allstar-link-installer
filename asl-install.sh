#!/bin/bash

# Prompt user for confirmation before proceeding
read -p "This script will install AllStarLink on your system. Do you wish to continue? (y/n) " -r
echo    # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Installation canceled."
    exit 1
fi

# Update package index and install necessary packages
echo "Updating package index..."
sudo apt update
echo "Installing curl and gpg..."
sudo apt install curl gpg -y

# Download and install AllStarLink repository
echo "Downloading AllStarLink repository installation script..."
cd /tmp
wget http://apt.allstarlink.org/repos/asl_builds/install-allstarlink-repository
echo "Setting executable permission on installation script..."
chmod +x install-allstarlink-repository
echo "Running installation script..."
sudo ./install-allstarlink-repository

# Install required packages for AllStarLink
echo "Installing required packages for AllStarLink..."
sudo apt -y install linux-headers-$(uname -r)
sudo apt -y install asl-asterisk
sudo apt -y install allstar-helpers
sudo apt -y install asl-dahdi-linux
sudo apt -y install asl-update-node-list

echo "AllStarLink installation complete."
