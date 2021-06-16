# Create An IAM Role And Policy For EKS

In this lab you will create a the appropriate IAM role and policy for EKS.

## Create the EKS IAM Terraform Configuration

1. You can find the Terraform configuration for IAM [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/blob/main/Terraform-AWS-Services-Creation/EKS-IAM/main.tf). The Terraform configuration files are used to create an IAM Role and Policy for EKS. 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `aws_iam_role` and `aws_iam_policy` Terraform resource to create a new IAM configuration. 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply - To create the resource