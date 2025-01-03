# Azure Monitoring Project
---
**A Hands-on Lab for Monitoring Azure Virtual Machines with Azure Monitor**
---

This project demonstrates how to set up and monitor an Azure Virtual Machine using Azure Monitor, including configuring alerts and notifications for CPU usage. It highlights essential monitoring practices and network configuration in Azure.

---

## Table of Contents
1. [Project Objectives](#project-objectives)
2. [Steps Implemented](#steps-implemented)
3. [Monitoring Setup](#monitoring-setup)
4. [Screenshots](#screenshots)
5. [Technologies Used](#technologies-used)
6. [Useful Links](#useful-links)
7. [License](#license)
8. [Contributions](#contributions)

---

## Project Objectives

- **Set Up Azure Resources:**  
  Create a virtual machine (VM), virtual network (VNet), and associated resources for hosting and monitoring.  

- **Implement Monitoring:**  
  Configure Azure Monitor to track CPU usage and set up alert rules for abnormal usage patterns.  

- **Test Alerts:**  
  Simulate high CPU usage to trigger alerts and validate email notifications through the configured action group.  

- **Automate with Terraform:**  
  Use Infrastructure as Code (IaC) to automate the deployment of the entire infrastructure.  

---

## Steps Implemented

1. **Clone the Repository**  
   - Downloaded the repository to the local environment:
     ```bash
     git clone https://github.com/dinAlexDu/azure-monitoring-project.git
     cd azure-monitoring-project
     ```

2. **Deploy Infrastructure with Terraform**  
   - Used Terraform to deploy the resources:
     ```bash
     terraform init
     terraform apply
     ```

3. **Access the VM via SSH**  
   - Connected to the virtual machine using SSH:
     ```bash
     ssh azureadmin@<public-ip>
     ```

4. **Simulate High CPU Usage**  
   - Run the following command to increase CPU usage and trigger the alert:
     ```bash
     yes > /dev/null &
     ```
   - To verify the running process, use:
     ```bash
     ps aux | grep yes
     ```
   - Identify the **PID** of the process created by the `yes > /dev/null &` command and terminate it using:
     ```bash
     kill <PID>
     ```
     Replace `<PID>` with the actual Process ID from the output of the `ps aux` command.


5. **Verify Alerts in Azure Monitor**  
   - Checked Azure Monitor for triggered alerts and validated email notifications.

6. **Clean Up Resources**  
   - Destroyed the infrastructure to avoid incurring charges:
     ```bash
     terraform destroy
     ```

---

## Monitoring Setup

### 1. Azure Monitor  
Azure Monitor is configured to track CPU usage and trigger alerts when specific thresholds are exceeded.

#### Steps to Configure CPU Usage Alerts:
1. Navigate to **Azure Monitor** in the Azure Portal.
2. Select **Alerts** > **+ Create** > **Alert rule**.
3. **Scope**: Select the target resource (e.g., the virtual machine `UbuntuVM`).
4. **Condition**: Choose the metric signal `Percentage CPU` and set the following:
   - **Threshold**: Static
   - **Operator**: Greater than
   - **Threshold Value**: `75`
   - **Aggregation Type**: Average
   - **Evaluation Period**: 5 minutes  
   - **Frequency of Evaluation**: Every 5 minutes
5. **Action Group**: Select an existing Action Group or create a new one (see below).
6. **Details**: Provide a name for the alert rule (e.g., `CPUAbove75Percent`) and select its severity.
7. Save the configuration.

### 2. Action Group  
Action Groups define how Azure Monitor alerts notify users or take automated actions.

#### Steps to Create an Action Group:
1. In the Azure Portal, go to **Monitor** > **Manage Action Groups** > **+ Add Action Group**.
2. **Details**:
   - **Action Group Name**: `InfraAlertsGroup`
   - **Short Name**: `InfraAlerts`
   - **Subscription**: Select your Azure subscription.
   - **Resource Group**: `BasicInfraRG`
3. **Notifications**:
   - Select **Notification Type**: Email/SMS/Push/Voice.
   - Provide the required details (e.g., email address: `youremail@example.com`).
4. **Actions**:
   - (Optional) Configure automated actions such as webhooks or Azure Functions.
5. **Review and Create**: Save the Action Group.

#### How to Configure Multiple Email Recipients:
- To add multiple email recipients, separate the email addresses with commas in the **Email/SMS/Push/Voice** section of the Action Group configuration.

#### Verify Action Group:
- Navigate to **Action Groups** in the Azure Portal.
- Locate the `InfraAlertsGroup` and check its notification and action settings.

#### Notes:
- Action Groups can also be configured to integrate with **ITSM tools**, **Logic Apps**, or **Automation Runbooks** for advanced scenarios.
- Ensure that email notifications are verified to avoid missing critical alerts.

---

---

## Screenshots

### 1. Azure Resources Overview  
![Azure Resources Overview](images/azure_resources_overview.png)  
*Lists all resources created in the `BasicInfraRG` resource group.*

### 2. Alert Configuration  
![Alert Configuration](images/alert_configuration.png)  
*Shows the configuration of the alert rule monitoring CPU usage above 75%.*

### 3. Alert Fired  
![Alert Fired](images/alert_fired.png)  
*Indicates an alert was triggered due to high CPU usage.*

### 4. CPU Utilization Test  
![CPU Utilization Test](images/cpu_utilization_test.png)  
*Displays the `yes > /dev/null &` command used to simulate high CPU usage.*

### 5. VM Networking  
![VM Networking](images/vm_networking.png)  
*Shows the network configuration of the virtual machine, including public and private IPs.*

### 6. Inbound Security Rule  
![Inbound Security Rule](images/inbound_rule.png)  
*NSG inbound rule allowing SSH access (port 22).*

### 7. SSH Connection  
![SSH Connection](images/ssh_connection.png)  
*Shows a successful SSH session with the VM.*

### 8. Action Group Configuration  
![Action Group Configuration](images/action_group_configuration.png)  
*Displays the configuration of the action group, including email notifications.*

---

## Technologies Used

- **[Terraform](https://developer.hashicorp.com/terraform):** Infrastructure as Code (IaC) for provisioning resources.  
- **[Azure Monitor](https://learn.microsoft.com/en-us/azure/azure-monitor/):** Monitoring and alerting for Azure resources.  
- **[Azure Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/):** Platform for deploying and managing virtual machines.  
- **[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/):** Command-line interface for managing Azure resources.  

---

## Useful Links

- **[Azure Monitor Documentation](https://learn.microsoft.com/en-us/azure/azure-monitor/):**  
  Guide to setting up monitoring and alerting in Azure.  

- **[Terraform Documentation](https://developer.hashicorp.com/terraform):**  
  Official Terraform documentation for managing cloud infrastructure.  

- **[Azure VM Documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/):**  
  Comprehensive guide to Azure Virtual Machines.  

- **[Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/):**  
  Official guide for using the Azure CLI.  

---

## License

This project is licensed under the [MIT License](./LICENSE).  
See the LICENSE file for detailed terms and conditions.  

---

## Contributions

Contributions are welcome!  
If you have suggestions for improvements or additional use cases, feel free to [fork this repository](https://github.com/dinAlexDu/azure-monitoring-project) and submit a pull request.  

Please adhere to our [Code of Conduct](./CODE_OF_CONDUCT.md) when contributing to this project.  
