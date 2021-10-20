# Create an Azure VNET

In this lab you will create a Virtual Network (VNET) that will be used to deploy your AKS instance into

## Create the Azure VNET Terraform Configuration

1. You can find the Terraform configuration for Azure Virtual Network [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-AZURE-Services-Creation/VNET). The Terraform configuration files are used to create an Azure Vitual Network. 

The Terraform `main.tf` will do a few things:
- Use the `azurerm_virtual_network` Terraform resource to create a VNET. 
- Use the `azurerm_subnet` Terraform resource to create relevant subnets. 
- Use the `uksouth` region, but feel free to change that if you'd like


2. Create the ACR by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource