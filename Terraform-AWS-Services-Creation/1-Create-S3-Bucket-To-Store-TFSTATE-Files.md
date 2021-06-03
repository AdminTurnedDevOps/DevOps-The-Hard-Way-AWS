# Create an S3 bucket to store Terraform state files

In this lab you will create an S3 bucket that will be used to store Terraform state files

## Create The Terraform Configurations

1. You can find the Terraform configuration for the S3 bucket [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/ECR). The Terraform configuration files are used to create a repository in Elastic Container Repository (ECR). The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `aws_ecr_repository` Terraform resource to create a new respository. 

