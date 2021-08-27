module "api_gateway" {
  source = "../../../../modules/support/services/api-gateway"

  owner                      = var.owner
  environment                = var.environment
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids         = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  frontend_security_group_id = data.terraform_remote_state.load_balancers.outputs.frontend_sg_id
  private_load_balancer_arn  = data.terraform_remote_state.load_balancers.outputs.nlb_arn
  internal_load_balancer_dns = data.terraform_remote_state.load_balancers.outputs.nlb_dns
}

