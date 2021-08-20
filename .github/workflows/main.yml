name: CI

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-west-1

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1

      - name: Terraform Init
        working-directory: Terraform-AWS-Services/elasticsearch/elasticsearch_configuration/
        run: |
          terraform init \
            -backend-config "bucket=terraform-states-monitoring-platform" \
            -backend-config "key=elasticsearch-terraform.tfstate"
          terraform workspace new dev || terraform workspace select dev
      - name: Terraform Format
        working-directory: Terraform-AWS-Services/elasticsearch/elasticsearch_configuration/
        run: terraform fmt

      - name: Terraform Plan
        working-directory: Terraform-AWS-Services/elasticsearch/elasticsearch_configuration/
        run: terraform plan -var="environment=development" -var="elasticsearch_password=${{ secrets.ELASTICSEARCH_PASSWORD }}"

      - name: Terraform Apply
        working-directory: Terraform-AWS-Services/elasticsearch/elasticsearch_configuration/
        run: terraform apply -var="environment=development" -var="elasticsearch_password=${{ secrets.ELASTICSEARCH_PASSWORD }}" -auto-approve
