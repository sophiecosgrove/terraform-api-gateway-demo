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
