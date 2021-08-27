module "ecr" {
  source      = "../../../../modules/support/services/ecr"
  environment = var.environment
  owner       = var.owner
}
