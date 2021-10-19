# Create An AKS Cluster and IAM Role/Policy

In this lab you will create:
- The appropriate IAM role and policy for AKS.
- The AKS cluster

## Create the AKS Terraform Configuration

1. You can find the Terraform configuration for AKS [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-Azure-Services-Creation/AKS-With-Worker-Nodes). The Terraform configuration files are used to create an AKS cluster and IAM Role/Policy for AKS. 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `Azure_iam_role` and `Azure_iam_policy` Terraform resource to create a new IAM configuration. 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource
