module "rds" {
  source = "../../../../modules/support/services/rds"

  environment        = var.environment
  owner              = var.owner
  storage            = 10
  engine             = "postgres"
  engine_version     = 12.5
  instance_class     = "db.t2.small"
  username           = var.username
  password           = var.password
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
}