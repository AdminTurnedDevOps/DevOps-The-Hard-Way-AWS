# Create an S3 bucket to store Terraform state files

In this lab you will create an S3 bucket that will be used to store Terraform state files

## Create The Terraform Configurations

1. You can find the Terraform configuration for the S3 bucket [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/terraform-state-s3-bucket). The Terraform configuration files are used to create an S3 bucket that will store your TFSTATE.

The Terraform `main.tf` will do a few things:
- Create the S3 bucket in the `us-east-1` region
- Ensure that version enabling is set to `True`
- Utilize AES256 encryption 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply` - To create the resource
