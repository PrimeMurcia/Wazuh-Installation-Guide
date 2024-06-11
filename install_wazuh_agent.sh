#!/bin/bash

# Prompt the user for the Wazuh manager IP
read -p "Enter the Wazuh Manager IP address: " WAZUH_MANAGER

# Prompt the user for the Wazuh agent name
read -p "Enter the Wazuh Agent name: " WAZUH_AGENT_NAME

# Set the Wazuh agent group to 'default'
WAZUH_AGENT_GROUP='default'

# Download the Wazuh agent package
wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.4-1_amd64.deb

# Install the Wazuh agent with the specified configurations
sudo WAZUH_MANAGER="$WAZUH_MANAGER" WAZUH_AGENT_GROUP="$WAZUH_AGENT_GROUP" WAZUH_AGENT_NAME="$WAZUH_AGENT_NAME" dpkg -i ./wazuh-agent_4.7.4-1_amd64.deb

# Reload the systemd manager configuration
sudo systemctl daemon-reload

# Enable the Wazuh agent to start at boot
sudo systemctl enable wazuh-agent

# Start the Wazuh agent
sudo systemctl start wazuh-agent
