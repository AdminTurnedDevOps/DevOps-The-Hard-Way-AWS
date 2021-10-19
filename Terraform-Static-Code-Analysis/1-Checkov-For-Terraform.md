# Checkov For Terraform

Just like any other piece of code, you should be testing Infrastructure-as-Code. There are a few ways to test Terraform code, but one of the leaders is Checkov by Bridgecrew (which has just been bought by Palo Alto).

Checkov is an open-source static/security analysis tool that you can use to set up policies (Policy-as-Code) for Terraform code and many other configuration languages.

## Install Checkov

1. Ensure you have Python installed
2. Run the following command:
`pip install checkov`
OR
`pip3 install checkov`
3. Run `checkov` on a terminal and you'll see a prompt that will set you up with the free Bridgecrew UI, which is where you can view the results of the Terraform scan. Press `Y` to start the process.
4. Run a scan to the Terraform code. For this process, you can scan all of the Terraform code in the `Terraform-AZURE-Services-Creation` directory.

An example of this would be:
`checkov --directory DevOps-The-Hard-Way-Azure/Terraform-AZURE-Services-Creation/ACR`

You'll then see what tests have passed, what tests have failed, and what you can do to remediate the issues. You can either view the results on the terminal or from the UI.