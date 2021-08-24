# internal load balancer
resource "aws_lb" "internal_network_load_balancer" {
  name                             = "${var.owner}-${var.environment}-internal-lb"
  subnets                          = var.private_subnet_ids
  internal                         = true
  load_balancer_type               = "network"
  enable_cross_zone_load_balancing = true
}

# public load balancer
resource "aws_lb" "ecs_application_load_balancer" {
  name                             = "${var.owner}-${var.environment}-public-lb"
  subnets                          = var.public_subnet_ids
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.alb_sg.id]
  enable_cross_zone_load_balancing = true
}