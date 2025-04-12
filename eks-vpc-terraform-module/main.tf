terraform {
  backend "s3" {
    bucket         = var.state_bucket
    key            = "terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
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
