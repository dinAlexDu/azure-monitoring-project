
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

## Monitoring Setup
### Azure Monitor
1. Navigate to Azure Monitor in the Azure portal.
2. Configure metrics and create an alert rule for CPU usage greater than 75%.

### Action Group
1. Set up an Action Group with notifications (email or SMS) for alert triggers.



