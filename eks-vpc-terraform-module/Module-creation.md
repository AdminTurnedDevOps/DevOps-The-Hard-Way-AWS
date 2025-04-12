# Create An EKS Cluster, VPC, and Subnets

In this lab you will create:
- The appropriate IAM role and policy for EKS.
- The VPC with 2 private subnets and 2 public subnets
- The EKS cluster

## Create the EKS Terraform Configuration

1. You can find the Terraform configuration for EKS [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/eks-vpc-terraform-module). The Terraform configuration files are used to create an EKS cluster, IAM roles, and a VPC with two private subnets and two public subnets.

You will see a directory structure that looks like the following:

```
eks-vpc-terraform-module/
├── main.tf                  # Main Terraform file that calls the EKS and VPC module
├── variables.tf             # Input variables for the project
├── dev.tfvars               # Variable values for the development environment
├── prod.tfvars              # Variable values for the production environment
└── modules/
    └── eks/                 # EKS module
        ├── main.tf          # Provider configuration
        ├── variables.tf     # Module input variables
        └── outputs.tf       # Module outputs
    └── vpc/                 # VPC module
        ├── main.tf          # Provider configuration
        ├── variables.tf     # Module input variables
        └── outputs.tf       # Module outputs
```

2. The `main.tf` will do a few things deploy the module
   You will need to pass in a `tfvars` file at runtime.
   There are two `tfvars` files:
     - dev.tfvars
     - prod.tfvars
   Please ensure to pass in appropriate values for your environment

3. To run the configuration:
- `cd eks-vpc-terraform-module`
- `terraform init -backend-config "bucket=BUCKET_NAME"` - To initialize the working directory and pull down the provider
   example: `terraform init -backend-config "bucket=tfstate-dev-devopsthehardway"`

- `terraform plan --var-file=dev.tfvars` - To go through a "check" and confirm the configurations are valid. You will need to change the `tfvars` file between dev and prod
- `terraform apply --var-file=dev.tfvars --auto-approve' - To create the resource. You will need to change the `tfvars` file between dev and prod