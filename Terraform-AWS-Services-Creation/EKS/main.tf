terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway"
    key    = "eks-terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# IAM Role for EKS to have access to the appropriate resources
resource "aws_iam_role" "eks-iam-role" {
  name = "devopsthehardway-eks-iam-role"

  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

## Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-iam-role.name
}

## Create the EKS cluster
resource "aws_eks_cluster" "devopsthehardway-eks" {
  name = "devopsthehardway-cluster"
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = [var.subnet_id_1, var.subnet_id_2]
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}


resource "aws_iam_role" "eks-fargate" {
  name = "eks-fargate-devopsthehardway"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.eks-fargate.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy-fargate" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-fargate.name
}

resource "aws_eks_fargate_profile" "devopsthehardway-eks-serverless" {
  cluster_name           = aws_eks_cluster.devopsthehardway-eks.name
  fargate_profile_name   = "devopsthehardway-serverless-eks"
  pod_execution_role_arn = aws_iam_role.eks-fargate.arn
  subnet_ids             = [var.private_subnet_id_1]

  selector {
    namespace = "default"
  }
}
