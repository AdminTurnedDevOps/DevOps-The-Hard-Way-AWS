# Create An AKS Cluster and IAM Roles

In this lab you will create:
- The AKS cluster
- The appropriate IAM roles for AKS

## Create the AKS Terraform Configuration

1. You can find the Terraform configuration for AKS [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-AZURE-Services-Creation/AKS). The Terraform configuration files are used to create an AKS cluster and IAM Role/Policy for AKS. 

The Terraform `main.tf` will do a few things:
- Use the `azurerm_kubernetes_cluster` Terraform resource to AKS Cluster 
- Use the `azurerm_role_assignment` Terraform resource to create the two neccessary role assignments 
- Use the `uksouth` region, but feel free to change that if you'd like

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource
