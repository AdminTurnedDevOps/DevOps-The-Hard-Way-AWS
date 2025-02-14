variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "stack_name" {
  description = "The name of the CloudFormation stack"
  default     = "eks-uber-stack"
}

variable "vpc_block" {
  description = "The CIDR range for the VPC"
  default     = "192.168.0.0/16"
}

variable "public_subnet01_block" {
  description = "CidrBlock for public subnet 01 within the VPC"
  default     = "192.168.0.0/18"
}

variable "public_subnet02_block" {
  description = "CidrBlock for public subnet 02 within the VPC"
  default     = "192.168.64.0/18"
}

variable "private_subnet01_block" {
  description = "CidrBlock for private subnet 01 within the VPC"
  default     = "192.168.128.0/18"
}

variable "private_subnet02_block" {
  description = "CidrBlock for private subnet 02 within the VPC"
  default     = "192.168.192.0/18"
}
