# application load balancer security group rules
resource "aws_security_group_rule" "alb_egress_rule" {
  from_port         = 0
  protocol          = -1
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
# only required if using alb to forward HTTP to HTTPS
//resource "aws_security_group_rule" "allow_tcp_443_inbound_to_public_lb" {
//  from_port         = 443
//  protocol          = "tcp"
//  security_group_id = aws_security_group.alb_sg.id
//  to_port           = 443
//  type              = "ingress"
//  cidr_blocks       = ["0.0.0.0/0"]
//}

resource "aws_security_group_rule" "alb_ingress_80_rule" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = var.my_ip
}

# frontend application security group rules
resource "aws_security_group_rule" "frontend_app_ingress_3000_rule" {
  from_port                = 3000
  protocol                 = "tcp"
  security_group_id        = aws_security_group.frontend_app_sg.id
  to_port                  = 3000
  type                     = "ingress"
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "frontend_app_egress_rule" {
  from_port         = 0
  protocol          = -1
  security_group_id = aws_security_group.frontend_app_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}