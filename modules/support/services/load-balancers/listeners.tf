resource "aws_lb_listener" "nlb_backend_users_listener" {
  load_balancer_arn = aws_lb.internal_network_load_balancer.arn
  port              = 3002
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_backend_users_target_group_blue.arn
  }
  lifecycle {
    ignore_changes = [default_action]
  }
}

resource "aws_lb_listener" "nlb_backend_products_listener" {
  load_balancer_arn = aws_lb.internal_network_load_balancer.arn
  port              = 3001
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_backend_products_target_group_blue.arn
  }
  lifecycle {
    ignore_changes = [default_action]
  }
}

resource "aws_lb_listener" "alb_listener_80" {
  load_balancer_arn = aws_lb.ecs_application_load_balancer.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_frontend_target_group_blue.arn
  }
  lifecycle {
    ignore_changes = [
      default_action]
  }
}
# for configurations where the load balancer redirects http traffic to https, replace above default action with:
//    type             = "redirect"
//
//    redirect {
//      port = "443"
//      protocol = "HTTPS"
//      status_code = "HTTP_301"
//    }



# and add:
//resource "aws_lb_listener" "lb_frontend_listener_443" {
//  load_balancer_arn = aws_lb.ecs_application_load_balancer.arn
//  port              = 443
//  protocol          = "HTTPS"
//  ssl_policy        = "ELBSecurityPolicy-2016-08"
//  certificate_arn   = var.certificate_arn
//
//  default_action {
//    type             = "forward"
//    target_group_arn = aws_lb_target_group.lb_frontend_target_group_blue.arn
//  }
//  lifecycle {
//    ignore_changes = [default_action]
//  }
//}
# note that this requires a domain name and certificate