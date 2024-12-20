
# Azure Monitoring Project

This project demonstrates how to set up and monitor an Azure Virtual Machine using Azure Monitor, including configuring alerts and notifications for CPU usage. It highlights essential monitoring practices and network configuration in Azure.

## Features
- **Azure Resource Group:** BasicInfraRG
- **Virtual Network (VNet):** BasicVNet with subnets
- **Ubuntu Virtual Machine (VM):** Configured with public IP and monitoring capabilities
- **Azure Monitor:** Configured to track CPU usage with alerts
- **Action Groups:** Set up for notifications

---

## Resources Created
- **Resource Group:** BasicInfraRG
- **Virtual Network:** BasicVNet (10.0.0.0/16)
  - **Subnets:**
    - `default` - 10.0.0.0/24
    - `BasicSubnet` - 10.0.1.0/24
- **Network Security Group:** UbuntuVM-NSG
  - Rule to allow SSH (port 22)
- **Virtual Machine:**
  - Name: UbuntuVM
  - Size: Standard B1s
  - OS: Ubuntu 20.04 LTS
  - Public IP: Enabled
- **Monitoring and Alerts:**
  - Alert Rule: CPUAbove75Percent
  - Action Group: InfraAlertsGroup

---

## Prerequisites
Ensure you have the following:
- Azure subscription (e.g., Azure for Students)
- Azure CLI: [Install Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Basic knowledge of Azure services

---

## Setup Steps

### 1. Clone this repository
Clone the repository to your local environment:
```bash
git clone https://github.com/dinAlexDu/azure-monitoring-project.git
cd azure-monitoring-project
```

### 2. Create Infrastructure
Deploy the infrastructure using Terraform:
```bash
terraform init
terraform apply
```

### 3. SSH into the VM
Connect to the virtual machine via SSH:
```bash
ssh azureadmin@<public-ip>
```

### 4. Trigger CPU Usage Alert
Run the following command to stress the CPU and trigger an alert:
```bash
yes > /dev/null &
```

### 5. Clean Up Resources
To avoid unnecessary charges, destroy the resources created by Terraform when you no longer need them:
```bash
terraform destroy
```

## Monitoring Setup
### Azure Monitor
1. Navigate to Azure Monitor in the Azure portal.
2. Configure metrics and create an alert rule for CPU usage greater than 75%.

### Action Group
1. Set up an Action Group with notifications (email or SMS) for alert triggers.


## Screenshots

### Azure Resources Overview
![Azure Resources Overview](images/azure_resources_overview.png)
Description: Shows all resources created in the BasicInfraRG resource group, including the VM, NSG, Public IP, etc.

### Alert Configuration
![Alert Configuration](images/alert_configuration.png)
Description: Displays the alert configuration showing the Percentage CPU signal and configured conditions.

### Alert Fired
![Alert Fired](images/alert_fired.png)
Description: Shows the UbuntuVM | Alerts page with the triggered alert.

### CPU Utilization Test
![CPU Utilization Test](images/cpu_utilization_test.png)
Description: Displays the command `yes > /dev/null &` running in the VM to increase CPU usage.

### VM Networking
![VM Networking](images/vm_networking.png)
Description: Shows the VM's network configuration summary, including Public IP, associated NSG, and Subnet.

### Inbound Security Rule
![Inbound Security Rule](images/inbound_rule.png)
Description: Displays the NSG inbound rule configuration for SSH (AllowAnySSHInbound).

### SSH Connection
![SSH Connection](images/ssh_connection.png)
Description: Shows the terminal with a successful SSH connection to the VM (`azureadmin@<PublicIP>`).

### Action Group Configuration
![Action Group Configuration](images/action_group_configuration.png)
Description: Displays the basic configuration of the Action Group, including the name and notification type.


