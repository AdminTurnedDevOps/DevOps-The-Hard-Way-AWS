# Create EKS Cluster With CICD

In this lab, you'll learn how to create an EKS cluster using GitHub Actions. The code can be found [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/EKS-With-Worker-Nodes)


## Secrets
Prior to running the pipeline, you'll need to set up authentication from GitHub to AWS. To do that, you'll set up secrets.

You'll need an AWS Access Key ID and an AWS Secret Access Key as those are the two secrets you'll be adding into the GitHub repository. These two secrets will allow you to connect to AWS from GitHub Actions.

1. In the code repository, go to Settings --> Secrets
2. Add in two secrets:
`AWS_ACCESS_KEY_ID`
`AWS_SECRET_ACCESS_KEY`

The values should come from an AWS Access Key and Secret Key. The access key/secret key must be part of a user that has policies attached for the resources being created in AWS.

3. Save the secrets.

## Pipeline
Now that the secrets are created, it's time to create the pipeline.

1. Under the GitHub repository, click on the **Actions** tab
2. Under **Get started with Actions**, click the *set up a workflow yourself* button
3. Inside of the workflow, copy in the contents that you can find [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/blob/main/.github/workflows/main.yml)

The pipeline does a few things:
- On line 4, you'll see `workflow_dispatch`, which means the pipeline won't automatically run unless you kick it off. You can of course change this to have the pipeline automatically run if you, for example, push code to the `dev` or `main` branch.
- The code is checked-out
- Authentication occurs to AWS
- Terraform is set up
- Terraform init occurs
- Terraform format occurs
- Terraform plan occurs
- Terraform apply occurs

4. Run the pipeline and watch as the pipeline automatically creates the EKS cluster
