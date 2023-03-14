variable "region" {
  #default = "eu-central-1"
  default = "us-east-1"
}

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

variable "public_subnets" {}

variable "private_subnets" {}

variable "environment" {}