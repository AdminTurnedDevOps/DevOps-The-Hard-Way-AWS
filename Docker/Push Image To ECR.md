# Push Image To ECR

The ECR repository will be where you store the Docker image that you created on your local computer in step 1.

## Log Into The ECR Repository
1. Terraform Code
2. Log in to ECR with AWS CLI
`aws ecr get-login-password --region *your_aws_region* | docker login --username AWS --password-stdin *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com`

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 529088272788.dkr.ecr.us-east-1.amazonaws.com

## Tag The Docker Image
1. Tag the Docker image
`docker tag uber *your_aws_account_id*.dkr.ecr.*your_aws_region*.amazonaws.com`

## Push The Docker Image To ECR
1. Push the Docker image to ECR
`docker push *your_aws_account_id*.dkr.ecr.us-east-1.amazonaws.com/*repo_name*`