module "ecs_cluster" {
  source      = "../../../../modules/support/services/cluster"
  owner       = var.owner
  environment = var.environment
}