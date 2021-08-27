module "ecs_frontend" {
  source = "../../../../modules/support/services/ecs-frontend"

  environment                         = var.environment
  owner                               = var.owner
  vpc_id                              = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids                  = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  frontend_repo_url                   = data.terraform_remote_state.ecr.outputs.frontend_repo_url
  api_url                             = data.terraform_remote_state.api_gateway.outputs.invoke_url
  cluster_id                          = data.terraform_remote_state.cluster.outputs.cluster_id
  cluster_name                        = data.terraform_remote_state.cluster.outputs.cluster_name
  frontend_sg_id                      = data.terraform_remote_state.load_balancers.outputs.frontend_sg_id
  alb_frontend_target_group_blue_arn   = data.terraform_remote_state.load_balancers.outputs.alb_frontend_target_group_blue_arn
  alb_frontend_listener_arn            = data.terraform_remote_state.load_balancers.outputs.alb_frontend_listener_arn
  alb_frontend_target_group_blue_name  = data.terraform_remote_state.load_balancers.outputs.alb_frontend_target_group_blue_name
  alb_frontend_target_group_green_name = data.terraform_remote_state.load_balancers.outputs.alb_frontend_target_group_green_name
  ecs_role_for_ecr_arn                = data.terraform_remote_state.backend_users.outputs.ecs_role_for_ecr_arn
  code_deploy_role_arn                = data.terraform_remote_state.code_deploy.outputs.code_deploy_role_arn
}