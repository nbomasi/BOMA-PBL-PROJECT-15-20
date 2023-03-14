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

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "private_subnet-3" {}

variable "private_subnet-4" {}

variable "vpc_security_group_ids" {}