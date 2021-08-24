# target groups for applications in blue/green deployment style
resource "aws_lb_target_group" "nlb_backend_users_target_group_blue" {
  name        = "${var.owner}-${var.environment}-users-tg-blue"
  port        = 3002
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    port     = 3002
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "nlb_backend_users_target_group_green" {
  name        = "${var.owner}-${var.environment}-users-tg-green"
  port        = 3002
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    port     = 3002
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "nlb_backend_products_target_group_blue" {
  name        = "${var.owner}-${var.environment}-prdct-tg-blue"
  port        = 3001
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    port     = 3001
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "nlb_backend_products_target_group_green" {
  name        = "${var.owner}-${var.environment}-prdct-tg-green"
  port        = 3001
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    port     = 3001
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "alb_frontend_target_group_blue" {
  name        = "${var.owner}-${var.environment}-frntnd-tg-blue"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = "60"
    path                = "/health"
    port                = 3000
    protocol            = "HTTP"
    timeout             = "20"
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
  }
}

resource "aws_lb_target_group" "alb_frontend_target_group_green" {
  name        = "${var.owner}-${var.environment}-frntnd-tg-green"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = "60"
    path                = "/health"
    port                = 3000
    protocol            = "HTTP"
    timeout             = "20"
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
  }
}