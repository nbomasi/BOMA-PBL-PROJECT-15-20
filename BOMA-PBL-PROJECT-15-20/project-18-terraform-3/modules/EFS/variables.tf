variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "account_no" {
  type        = number
  description = "the account number"
}

variable "efs1_subnet_id" {}

variable "efs2_subnet_id" {}

variable "efs_security_groups" {}
  
