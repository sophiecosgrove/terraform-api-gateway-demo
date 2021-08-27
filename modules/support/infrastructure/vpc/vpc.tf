module "local_vpc" {
  source = "../../../local/vpc"
  environment = var.environment
  owner = var.owner
  cidr_block = var.cidr_block
  az_limit = length(data.aws_availability_zones.available_zones.names)
}