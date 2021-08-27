module "vpc" {
  source = "../../../../modules/support/infrastructure/vpc"
  environment = var.environment
  owner = var.owner
  cidr_block = "10.0.0.0/16"
}