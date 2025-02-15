terraform  {
  backend "s3" {
    bucket = "terraform-state-devops-the-hardway-amir-sayed"
    key    = "vpc-terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.stack_name}-VPC"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "Public Subnets"
    Network = "Public"
  }
}

resource "aws_route_table" "private01" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "Private Subnet AZ1"
    Network = "Private01"
  }
}

resource "aws_route_table" "private02" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "Private Subnet AZ2"
    Network = "Private02"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_eip" "main01" {
  domain      = "vpc"
}

resource "aws_eip" "main02" {
  domain      = "vpc"
}


resource "aws_nat_gateway" "main01" {
  
  allocation_id = aws_eip.main01.id
  subnet_id     = aws_subnet.public01.id

  tags = {
    Name = "${var.stack_name}-NatGatewayAZ1"
  }
}

resource "aws_nat_gateway" "main02" {
  allocation_id = aws_eip.main02.id
  subnet_id     = aws_subnet.public02.id

  tags = {
    Name = "${var.stack_name}-NatGatewayAZ2"
  }
}

resource "aws_route" "private01" {
  route_table_id         = aws_route_table.private01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main01.id
}

resource "aws_route" "private02" {
  route_table_id         = aws_route_table.private02.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main02.id
}

resource "aws_subnet" "public01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet01_block
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.stack_name}-PublicSubnet01"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "public02" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet02_block
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.stack_name}-PublicSubnet02"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet01_block
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.stack_name}-PrivateSubnet01"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private02" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet02_block
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.stack_name}-PrivateSubnet02"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_route_table_association" "public01" {
  subnet_id      = aws_subnet.public01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public02" {
  subnet_id      = aws_subnet.public02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private01" {
  subnet_id      = aws_subnet.private01.id
  route_table_id = aws_route_table.private01.id
}

resource "aws_route_table_association" "private02" {
  subnet_id      = aws_subnet.private02.id
  route_table_id = aws_route_table.private02.id
}

resource "aws_security_group" "control_plane" {
  name        = "eks-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.main.id
}
