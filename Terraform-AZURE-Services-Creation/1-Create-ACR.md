# Create an Azure Container Registry Repository

In this lab you will create a repository to store the Docker image that you created for the Uber app.

## Create the ACR Terraform Configuration

1. You can find the Terraform configuration for Azure Container Registry (ACR) [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-AZURE-Services-Creation/ACR). The Terraform configuration files are used to create a repository in Azure Container Registry (ACR). 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an Azure Storage Account
- Use the `uksouth` region, but feel free to change that if you'd like
- Use the `azurerm_resource_group` Terraform resource to create a new Resource Group. 
- Use the `azurerm_container_registry` Terraform resource to create a new ACR. 

2. Create the ACR by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource