# Wazuh 4.7 Installation Guide for Ubuntu 22.04 by Prime Murcia

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

## Password Change Instructions

If you need to change the password for the 'admin' user:

1. **Navigate to Wazuh OpenSearch Security Tools Directory:**

    ```bash
    cd /usr/share/wazuh-indexer/plugins/opensearch-security/tools
    ```

2. **Run Wazuh Password Tool:**

    ```bash
    bash wazuh-passwords-tool.sh -u admin -newpassword
    ```
    Note: Replace `newpassword` with the new password you want to set.

3. **Restart Wazuh Dashboard Service:**

    ```bash
    systemctl restart wazuh-dashboard
    ```

## Additional Notes

- Ensure your system meets the requirements for running Wazuh.
- Review the [Wazuh documentation](https://documentation.wazuh.com/current/) for any additional steps or considerations.

This guide provides a basic setup for Wazuh 4.7 on Ubuntu 22.04. Adjustments may be needed based on your specific environment and security considerations.
