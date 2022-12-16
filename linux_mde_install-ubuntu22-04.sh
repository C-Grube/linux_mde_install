#!/bin/bash

# Description: Simple Bash script to install MDE on Debian Linux
# Instructions: bash linux_install_mde.sh [/path/to/mde-onboarding-file.py]
#               sudo wget -P ~/Desktop --no-check-certificate https://raw.githubusercontent.com/C-Grube/linux_mde_install/main/linux_mde_install-ubuntu22-04.sh && bash ~/Desktop/linux_mde_install-ubuntu22-04.sh /mnt/vm_share/MicrosoftDefenderATPOnboardingLinuxServer.py
# Install pre-req software
sudo apt-get install curl -y
wait
sudo apt-get install libplist-utils -y
wait
sudo apt-get install gpg -y
wait
sudo apt-get install apt-transport-https -y
wait
#------------------------------------------------
# Configure the software repo
# You will have to change the below URL depending on which OS you are using. In this example, I was installing MDE on Debian 11.
curl -k https://packages.microsoft.com/config/ubuntu/22.04/prod.list -o /etc/apt/sources.list.d/microsoft-prod.list
wait
sed -i 's/https/http/g' /etc/apt/sources.list.d/microsoft-prod.list
wait
curl -k -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
wait
sudo apt-get update
wait
#------------------------------------------------
# Installing the MDE application
sudo apt-get install mdatp -y
wait
#------------------------------------------------
# Connecting the system to a MSFT tenant
sudo python3 $1
