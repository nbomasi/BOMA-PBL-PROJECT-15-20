variable "region" {}
  #default = "eu-central-1"
 # default = "us-east-1"


variable "vpc_cidr" {}


variable "enable_dns_support" {
  default = "true"
}

variable "enable_dns_hostnames" {
  default = "true"
}

#variable "access_ip" {}
# variable "enable_classiclink" {
#     default = "false"
# }

# variable "enable_classiclink_dns_support" {
#     default = "false"
# }

variable "preferred_number_of_public_subnets" {
  default = 2
}

variable "preferred_number_of_private_subnets" {
  default = 4
}

#variable "tags" {}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  default = "ACS"
}

# variable "ami" {
#   type        = string
#   description = "AMI ID for the launch template"
# }

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

variable "account_no" {
  type        = number
  description = "the account number"
}

variable "master-username" {
  type        = string
  description = "RDS admin username"
}

variable "master-password" {
  type        = string
  description = "RDS master password"
}

variable "db-username" {}

variable "environment" {}

variable "ami-nginx" {
  type        = string
  description = "ami for nginx"
}

variable "ami-ubuntu" {
  type        = string
  description = "ami for ubuntu"
}

variable "ami-web" {
  type        = string
  description = "ami for webservers"
}

variable "ami-bastion" {
  type        = string
  description = "ami for bastion"
}


