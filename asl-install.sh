#!/bin/bash

# Prompt user to update packages
read -p "Would you like to update your packages? (y/n) " choice
if [[ $choice =~ ^[Yy]$ ]]; then
  echo "Updating packages..."
  sudo apt update
fi

# Prompt user to install required packages
read -p "Would you like to install curl and gpg? (y/n) " choice
if [[ $choice =~ ^[Yy]$ ]]; then
  echo "Installing curl and gpg..."
  sudo apt install curl gpg
fi

# Download and install AllStarLink repository
echo "Downloading and installing AllStarLink repository..."
cd /tmp
wget http://apt.allstarlink.org/repos/asl_builds/install-allstarlink-repository
chmod +x install-allstarlink-repository
sudo ./install-allstarlink-repository

# Install required packages for AllStarLink
echo "Installing required packages for AllStarLink..."
sudo apt -y install linux-headers-$(uname -r)
sudo apt -y install asl-asterisk
sudo apt -y install allstar-helpers
sudo apt -y install asl-dahdi-linux
sudo apt -y install asl-update-node-list

echo "All packages and repositories have been installed."
