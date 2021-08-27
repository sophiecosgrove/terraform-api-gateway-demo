module "s3" {
  source = "../../../../modules/support/services/s3"

  environment  = var.environment
  owner        = var.owner
}