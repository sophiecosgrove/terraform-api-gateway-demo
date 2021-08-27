module "ecs_backend_products" {
  source = "../../../../modules/support/services/ecs-backend-products"

  owner                                        = var.owner
  environment                                  = var.environment
  dynamodb_products_port                       = "3001"
  dynamodb_table_name                          = data.terraform_remote_state.dynamodb.outputs.dynamodb_table_name
  s3_bucket_name                               = data.terraform_remote_state.s3.outputs.bucket_name
  s3_bucket_region                             = data.terraform_remote_state.s3.outputs.bucket_region
  product_repo_url                             = data.terraform_remote_state.ecr.outputs.product_repo_url
  cluster_id                                   = data.terraform_remote_state.cluster.outputs.cluster_id
  cluster_name                                 = data.terraform_remote_state.cluster.outputs.cluster_name
  private_subnet_ids                           = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id                                       = data.terraform_remote_state.vpc.outputs.vpc_id
  code_deploy_role_arn                         = data.terraform_remote_state.code_deploy.outputs.code_deploy_role_arn
  nlb_backend_products_target_group_blue_arn   = data.terraform_remote_state.load_balancers.outputs.nlb_backend_products_target_group_blue_arn
  ecs_role_for_ecr_arn                         = data.terraform_remote_state.ecs_backend_users.outputs.ecs_role_for_ecr_arn
  nlb_backend_products_listener_arn            = [data.terraform_remote_state.load_balancers.outputs.nlb_backend_products_listener_arn]
  nlb_backend_products_target_group_blue_name  = data.terraform_remote_state.load_balancers.outputs.nlb_backend_products_target_group_blue_name
  nlb_backend_products_target_group_green_name = data.terraform_remote_state.load_balancers.outputs.nlb_backend_products_target_group_green_name
  ip_cidrs                                     = formatlist("%s/32", [for eni in data.aws_network_interface.ids : eni.private_ip])
}
