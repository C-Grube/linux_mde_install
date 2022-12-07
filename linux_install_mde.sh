#!/bin/bash

# Description: Simple Bash script to install MDE on Debian Linux
# Date: 12/5/20222
# Instructions: bash linux_install_mde.sh [/path/to/mde-onboarding-file.py]

# Install pre-req software
sudo apt-get --allow-unauthenticated install curl
wait
sudo apt-get --allow-unauthenticated install libplist-utils
wait
sudo apt-get --allow-unauthenticated install gpg
wait
sudo apt-get --allow-unauthenticated install apt-transport-https
wait
#------------------------------------------------
# Configure the software repo
# You will have to change the below URL depending on which OS you are using. In this example, I was installing MDE on Debian 11.
curl -k https://packages.microsoft.com/config/debian/11/prod.list -o /etc/apt/sources.list.d/microsoft-prod.list
wait
curl -k -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
wait
sudo apt-get --allow-unauthenticated update
wait
#------------------------------------------------
# Installing the MDE application
sudo apt-get --allow-unauthenticated install mdatp
wait
#------------------------------------------------
# Connecting the system to a MSFT tenant
sudo python3 $1
