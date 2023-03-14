# AUTOMATE INFRASTRUCTURE WITH IAC USING TERRAFORM PART 1

This project is an automation of project 15. In project 15, we used AWS console, but in project 16, we will be
deploying the same infrasture, but all the infrasture of project 15 will be deploy in entirety from project 16 through 16.
In project 16, the following resources will be created:

* VPC
* 2 Public subnets
* concept of CIDRSUBNETS, LENGTH, COUNT VARIABLES, .TFVARS, 

**WHAT IS BOTO3**:The AWS python SDK is composed of two key Python packages: Botocore (the library providing the low-level functionality shared between the Python SDK and the AWS CLI) and Boto3 (the package implementing the Python SDK itself).
Documentation and developers tend to refer to the AWS SDK for Python as "Boto3,"
Note: to install boto3, we must intall python 3.7 and above.
Installing python: https://community.chocolatey.org/packages?q=python
Installing boto3/configuring python sdk: https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html
On windows I was only able to use powershell to install boto3, gitbash and cmd did not work. This is where we added AWS credentials.

**NOTE:** But this can also be done by adding the keys to the provider blocks

**.terraform\.**: This is where Terraform keeps plugins. Generally, it is safe to delete this folder. It just means that you must execute terraform init again, to download them.

**terraform.tfstate** : This is how Terraform keeps itself up to date with the exact state of the infrastructure. It reads this file to know what already exists, what should be added, or destroyed based on the entire terraform code that is being developed.

**terraform.tfstate.lock.info**: This is what Terraform uses to track, who is running its code against the infrastructure at any point in time. This is very important for teams working on the same Terraform repository at the same time. The lock prevents a user from executing Terraform configuration against the same infrastructure when another user is doing the same – it allows to avoid duplicates and conflicts.

Note: For project architectural plan, please see repo README.md file

