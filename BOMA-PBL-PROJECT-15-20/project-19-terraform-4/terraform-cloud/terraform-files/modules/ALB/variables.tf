variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "ip_address_type" {}

variable "load_balancer_type" {}

variable "private_sg" {}

variable "public_sg" {}

variable "public_subnet-1" {}

variable "public_subnet-2" {}

variable "private_subnet-1" {}

variable "private_subnet-2" {}

variable "vpc_id" {}



