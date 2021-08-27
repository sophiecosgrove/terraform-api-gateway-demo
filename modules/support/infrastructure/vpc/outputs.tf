output "private_subnet_ids" {
  value = module.local_vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.local_vpc.public_subnet_ids
}

output "vpc_id" {
  value = module.local_vpc.vpc_id
}