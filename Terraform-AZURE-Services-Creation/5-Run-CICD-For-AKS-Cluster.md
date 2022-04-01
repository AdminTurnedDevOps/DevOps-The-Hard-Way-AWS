# Create AKS Cluster With CICD

In this lab, you'll learn how to create an AKS cluster using GitHub Actions. The code can be found [here](https://github.com/thomast1906/DevOps-The-Hard-Way-Azure/tree/main/Terraform-AZURE-Services-Creation/AKS)


## Secrets
Prior to running the pipeline, you'll need to set up authentication from GitHub to Azure. To do that, you'll setup an Azure Service Principal.

Using the below AZ Cli(Note Down Secret): 

`az ad sp create-for-rbac --name devopsthehardway`

Alternatively - [this can be done via Azure Portal](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)

You'll need both the clientID of the service principal and secret that was created. 

Please Note: The Service Principal needs IAM permission to the subscription/resource group to where the Azure resources are deployed. In this example, I gave **contributor** access to the **subscription**. See examples on how to [assign an Azure Role here](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-steps)

You'll be adding 4 screts into the GitHub repository. These four secrets will allow you to connect to Azure from GitHub Actions.

1. In the code repository, go to Settings --> Secrets
2. Add in four secrets:

- `AZURE_AD_CLIENT_ID` – Will be the service principal ID from above
- `AZURE_AD_CLIENT_SECRET` – The secret that was created as part of the Azure Service Principal
- `AZURE_AD_TENANT_ID` – The Azure AD tenant ID to where the service principal was created
- `AZURE_SUBSCRIPTION_ID` – Subscription ID of where you want to deploy the Terraform

3. Save the secrets.

## Pipeline
Now that the secrets are created, it's time to create the pipeline.

1. Under the GitHub repository, click on the **Actions** tab
2. You will see a workflow already called `CI`
3. Select `CI` workflow and then select `Run workflow` `from` main branch

The pipeline does a few things:
- On line 4, you'll see `workflow_dispatch`, which means the pipeline won't automatically run unless you kick it off. You can of course change this to have the pipeline automatically run if you, for example, push code to the `dev` or `main` branch.
- The code is checked-out
- Authentication occurs to Azure
- Terraform is set up
- Terraform format occurs
- Terraform init occurs
- Terraform plan occurs
- Terraform apply occurs

1. Run the pipeline and watch as the pipeline automatically creates the AKS cluster
