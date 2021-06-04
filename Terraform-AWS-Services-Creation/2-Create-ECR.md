# Create an Elastic Container Registry Repository

In this lab you will create a repository to store the Docker image that you created for the Uber app.

## Create the ECR Terraform Configuration

1. You can find the Terraform configuration for ECR [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/ECR). The Terraform configuration files are used to create a repository in Elastic Container Repository (ECR). 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `aws_ecr_repository` Terraform resource to create a new respository. 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply - To create the resource