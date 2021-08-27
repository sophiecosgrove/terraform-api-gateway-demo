# tags
variable "owner" {}
variable "environment" {}

# config
variable "vpc_id" {}
variable "private_subnet_ids" {}
variable "frontend_security_group_id" {}
variable "private_load_balancer_arn" {}
variable "internal_load_balancer_dns" {}