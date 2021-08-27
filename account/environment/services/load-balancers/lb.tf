module "load_balancers" {
  source             = "../../../../modules/support/services/load-balancers"
  owner              = var.owner
  environment        = var.environment
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  my_ip              = ["${var.my_ip}/32"]
}