terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket  = var.state_bucket
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = "${var.cluster_name}-${var.env}"
  kubernetes_version = var.kubernetes_version
  subnet_ids         = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)

  desired_size   = var.desired_size
  min_size       = var.min_size
  max_size       = var.max_size
  instance_types = var.instance_types
  env            = var.env

  depends_on = [module.vpc]
} 
