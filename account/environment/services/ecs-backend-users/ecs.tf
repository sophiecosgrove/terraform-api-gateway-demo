module "ecs_backend_users" {
  source = "../../../../modules/support/services/ecs-backend-users"

  owner                                    = var.owner
  environment                              = var.environment
  rds_db_host                              = data.terraform_remote_state.rds.outputs.rds_db_address
  rds_db_port                              = "5432"
  rds_db_name                              = "sophiedemo"
  rds_db_username                          = var.rds_db_username
  rds_db_password                          = var.rds_db_password
  rds_users_port                           = "3002"
  users_repo_url                           = data.terraform_remote_state.ecr.outputs.users_repo_url
  cluster_id                               = data.terraform_remote_state.cluster.outputs.cluster_id
  cluster_name                             = data.terraform_remote_state.cluster.outputs.cluster_name
  private_subnet_ids                       = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id                                   = data.terraform_remote_state.vpc.outputs.vpc_id
  code_deploy_role_arn                     = data.terraform_remote_state.code_deploy.outputs.code_deploy_role_arn
  lb_backend_users_target_group_blue_arn   = data.terraform_remote_state.load_balancers.outputs.nlb_backend_users_target_group_blue_arn
  lb_backend_users_listener_arn            = [data.terraform_remote_state.load_balancers.outputs.nlb_backend_users_listener_arn]
  lb_backend_users_target_group_blue_name  = data.terraform_remote_state.load_balancers.outputs.nlb_backend_users_target_group_blue_name
  lb_backend_users_target_group_green_name = data.terraform_remote_state.load_balancers.outputs.nlb_backend_users_target_group_green_name
  ip_cidrs                                 = formatlist("%s/32", [for eni in data.aws_network_interface.ids : eni.private_ip])
  backend_users_sg_id                      = data.terraform_remote_state.rds.outputs.backend_users_sg_id
}
