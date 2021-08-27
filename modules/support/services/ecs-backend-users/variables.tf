# tags
variable "owner" {}
variable "environment" {}

# repo
variable "users_repo_url" {}

# environment variables for application
variable "rds_db_host" {}
variable "rds_db_port" {}
variable "rds_db_name" {}
variable "rds_db_username" {}
variable "rds_db_password" {}
variable "rds_users_port" {}

# cluster
variable "cluster_id" {}
variable "cluster_name" {}

# config
variable "private_subnet_ids" {}
variable "vpc_id" {}
variable "ip_cidrs" {}

# load balancer
variable "lb_backend_users_target_group_blue_arn" {}
variable "lb_backend_users_listener_arn" {}
variable "lb_backend_users_target_group_blue_name" {}
variable "lb_backend_users_target_group_green_name" {}

# code deploy
variable "code_deploy_role_arn" {}

# security group
variable "backend_users_sg_id" {}

