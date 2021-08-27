# security groups
output "frontend_sg_id" {
  value = module.load_balancers.frontend_sg_id
}

# network load balancer
output "nlb_arn" {
  value = module.load_balancers.nlb_arn
}

output "nlb_dns" {
  value = module.load_balancers.nlb_dns
}

# target groups
output "nlb_backend_users_target_group_blue_arn" {
  value = module.load_balancers.nlb_backend_users_target_group_blue_arn
}

output "nlb_backend_users_target_group_blue_name" {
  value = module.load_balancers.nlb_backend_users_target_group_blue_name
}

output "nlb_backend_users_target_group_green_name" {
  value = module.load_balancers.nlb_backend_users_target_group_green_name
}

output "nlb_backend_products_target_group_blue_arn" {
  value = module.load_balancers.nlb_backend_products_target_group_blue_arn
}

output "nlb_backend_products_target_group_blue_name" {
  value = module.load_balancers.nlb_backend_products_target_group_blue_name
}

output "nlb_backend_products_target_group_green_name" {
  value = module.load_balancers.nlb_backend_products_target_group_green_name
}

output "alb_frontend_target_group_blue_arn" {
  value = module.load_balancers.alb_frontend_target_group_blue_arn
}

output "alb_frontend_target_group_blue_name" {
  value = module.load_balancers.alb_frontend_target_group_blue_name
}

output "alb_frontend_target_group_green_name" {
  value = module.load_balancers.alb_frontend_target_group_green_name
}

# listeners
output "nlb_backend_users_listener_arn" {
  value = module.load_balancers.nlb_backend_users_listener_arn
}

output "nlb_backend_products_listener_arn" {
  value = module.load_balancers.nlb_backend_products_listener_arn
}

output "alb_frontend_listener_arn" {
  value = module.load_balancers.alb_frontend_listener_arn
}