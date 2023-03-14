region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

#enable_classiclink = "false"

#enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

ami-web = "ami-00d5ba7704bf95beb"

ami-bastion = "ami-0b9f34ef13d787392"

ami-nginx = "ami-0612d6947f9d41a8f"

ami-ubuntu = "ami-010936b6ac0d19fd3"

#ami-sonar = "ami-0f8bd95a744e074b8"

keypair = "osas"

account_no      = "276053850875"
master-username = "david"
master-password = "Password1"
db-username     = "david"


tags = {
  Owner-Email     = "confidonwakegho@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "276053850875"
}