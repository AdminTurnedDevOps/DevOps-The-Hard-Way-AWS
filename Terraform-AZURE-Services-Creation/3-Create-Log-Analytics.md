# Create an Azure Log Analytics Workspace

In this lab you will create a Log Analytics workspace that will be used to view container insights of your AKS Cluster

## Create the Log Analytics Workspace Terraform Configuration

1. You can find the Terraform configuration for Log Analytics [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-AZURE-Services-Creation/Log-Analytics). The Terraform configuration files are used to create the Log Analytiocs workspace. 

The Terraform `main.tf` will do a few things:
- Use the `azurerm_log_analytics_workspace` Terraform resource to create a Log Analytics workspace. 
- Use the `azurerm_log_analytics_solution` Terraform resource to enable the Log Analytics solution ContainerInsights. 
- Use the `uksouth` region, but feel free to change that if you'd like

2. Create the ACR by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource
