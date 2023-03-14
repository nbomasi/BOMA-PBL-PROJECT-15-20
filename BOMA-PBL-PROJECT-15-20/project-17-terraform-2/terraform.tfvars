region = "us-east-1"
#region = "eu-central-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

# enable_classiclink = "false" 

# enable_classiclink_dns_support = "false" 

preferred_number_of_public_subnets  = 2
preferred_number_of_private_subnets = 4

environment = "production"

ami = "ami-0b0af3577fe5e3532"

keypair = "bomasi"

# Ensure to change this to your acccount number
account_no = "581957715303"
master-username = "david"
master-password = "Password1"
db-username = "david"


tags = {
  Enviroment      = "production"
  Owner-Email     = "nbomasi@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "581957715303"
}
