# tags
variable "owner" {}
variable "environment" {}

# environment variables
variable "dynamodb_products_port" {}
variable "dynamodb_table_name" {}
variable "s3_bucket_name" {}
variable "s3_bucket_region" {}

# ecr
variable "product_repo_url" {}

# cluster
variable "cluster_id" {}
variable "cluster_name" {}

# network
variable "private_subnet_ids" {}
variable "vpc_id" {}
variable "ip_cidrs" {}

# load balancer
variable "nlb_backend_products_target_group_blue_arn" {}
variable "nlb_backend_products_listener_arn" {}
variable "nlb_backend_products_target_group_blue_name" {}
variable "nlb_backend_products_target_group_green_name" {}

# code deploy
variable "code_deploy_role_arn" {}

# iam
variable "ecs_role_for_ecr_arn" {}

