# Configure Credentials To Access AWS At The Programmatic Level

The purpse of this lab is to configure IAM credentials on your local computer so that you can access AWS at a programmatic level (SDKs, CLI, Terraform, etc.)

## IAM
1. Open up the AWS management console and go to IAM
2. Create a new user or use your existing AWS user 
3. Give the user programmatic access
4. Copy the access key and secret key

## Install The AWS CLI

### Windows
1. msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
2. aws --version
### Linux 
1. curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
2. unzip awscliv2.zip
3. sudo ./aws/install
4. aws --version (to confirm installation)

### macOS
1. curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
2. sudo installer -pkg AWSCLIV2.pkg -target /
3. aws --version

[Source](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
## Configure The AWS CLI

1. aws configure

## Here are examples of what it would look like when you configure your AWS account. 
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE 
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json