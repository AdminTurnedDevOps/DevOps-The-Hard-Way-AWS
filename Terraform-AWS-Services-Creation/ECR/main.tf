terraform {
  backend "s3" {
    bucket = "terraform-state-devops-the-hardway-amir-sayed"
    key    = "ecr-terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "devops-the-hardway-ecr-repo-amir" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}