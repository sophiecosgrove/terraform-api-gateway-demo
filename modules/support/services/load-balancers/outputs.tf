# security groups
output "frontend_sg_id" {
  value = aws_security_group.frontend_app_sg.id
}

# network load balancer
output "nlb_arn" {
  value = aws_lb.internal_network_load_balancer.arn
}

output "nlb_dns" {
  value = aws_lb.internal_network_load_balancer.dns_name
}

# target groups
output "nlb_backend_users_target_group_blue_arn" {
  value = aws_lb_target_group.nlb_backend_users_target_group_blue.arn
}

output "nlb_backend_users_target_group_blue_name" {
  value = aws_lb_target_group.nlb_backend_users_target_group_blue.name
}

output "nlb_backend_users_target_group_green_name" {
  value = aws_lb_target_group.nlb_backend_users_target_group_green.name
}

output "nlb_backend_products_target_group_blue_arn" {
  value = aws_lb_target_group.nlb_backend_products_target_group_blue.arn
}

output "nlb_backend_products_target_group_blue_name" {
  value = aws_lb_target_group.nlb_backend_products_target_group_blue.name
}

output "nlb_backend_products_target_group_green_name" {
  value = aws_lb_target_group.nlb_backend_products_target_group_green.name
}

output "alb_frontend_target_group_blue_arn" {
  value = aws_lb_target_group.alb_frontend_target_group_blue.arn
}

output "alb_frontend_target_group_blue_name" {
  value = aws_lb_target_group.alb_frontend_target_group_blue.name
}

output "alb_frontend_target_group_green_name" {
  value = aws_lb_target_group.alb_frontend_target_group_green.name
}

# listeners
output "nlb_backend_users_listener_arn" {
  value = aws_lb_listener.nlb_backend_users_listener.arn
}

output "nlb_backend_products_listener_arn" {
  value = aws_lb_listener.nlb_backend_products_listener.arn
}

output "alb_frontend_listener_arn" {
  value = aws_lb_listener.alb_listener_80.arn
}
