# tags
variable "environment" {}
variable "owner" {}

# Infrastructure
variable "vpc_id" {}
variable "private_subnet_ids" {}

# ecr
variable "frontend_repo_url" {}

# api invoke url
variable "api_url" {}

# cluster
variable "cluster_id" {}
variable "cluster_name" {}

# security
variable "frontend_sg_id" {}

# load balancer
variable "alb_frontend_target_group_blue_arn" {}
variable "alb_frontend_listener_arn" {}
variable "alb_frontend_target_group_blue_name" {}
variable "alb_frontend_target_group_green_name" {}

# iam
variable "ecs_role_for_ecr_arn" {}
variable "code_deploy_role_arn" {}

