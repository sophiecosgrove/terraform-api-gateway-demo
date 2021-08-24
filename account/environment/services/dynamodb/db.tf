module "dynamodb" {
  source = "../../../../modules/support/services/dynamodb"
  owner = var.owner
  environment = var.environment
  hash_key = "id"
}