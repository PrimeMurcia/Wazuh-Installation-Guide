# Wazuh 4.7 Installation Guide and install agent for Ubuntu 22.04

## Prerequisites
- A clean installation of Ubuntu 22.04.
- Administrative privileges (sudo access).

## Installation

1. **Download and Run the Wazuh Install Script:**

    ```bash
    wget https://packages.wazuh.com/4.7/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
    ```

2. **Switch to Superuser (root):**

    ```bash
    sudo su
    ```

3. **Navigate to Wazuh OpenSearch Security Tools Directory:**

    ```bash
    cd /usr/share/wazuh-indexer/plugins/opensearch-security/tools
    ```

4. **List Files in the Directory:**

    ```bash
    ls
    ```

5. **Run Wazuh Password Tool to Set Admin Password:**

    ```bash
    bash wazuh-passwords-tool.sh -u admin -yourpassword
    ```
    Note: Replace `yourpassword` with the actual password you want to set.

6. **Restart Wazuh Dashboard Service:**

    ```bash
    systemctl restart wazuh-dashboard
    ```

7. **Restart Filebeat Service:**

    ```bash
    systemctl restart filebeat
    ```

## Wazuh Agent Installation Script

This guide provides a script to install and configure the Wazuh agent on a Linux machine. The script will prompt you to enter the Wazuh Manager IP address and the Wazuh Agent name interactively.

1. **Installation Script**
Save the following script as install_wazuh_agent.sh:

    ```bash
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

    ```

2. **Make the script executable:**

    ```bash
    chmod +x install_wazuh_agent.sh
    ```

3. **Run the script:**

    ```bash
    ./install_wazuh_agent.sh
    ```

3. **Follow the prompts:**

*Enter the Wazuh Manager IP address*

*Enter the Wazuh Agent name*
    
## Additional Notes

- Ensure your system meets the requirements for running Wazuh.
- Review the [Wazuh documentation](https://documentation.wazuh.com/current/) for any additional steps or considerations.

This guide provides a basic setup for Wazuh 4.7 on Ubuntu 22.04. Adjustments may be needed based on your specific environment and security considerations.
