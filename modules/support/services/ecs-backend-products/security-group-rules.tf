# Security Group Rules for Backend Products Service
resource "aws_security_group_rule" "tcp_inbound_port_3001" {
  from_port         = 3001
  protocol          = "tcp"
  security_group_id = aws_security_group.ecs_security_group_backend_products.id
  to_port           = 3001
  type              = "ingress"
  cidr_blocks = var.ip_cidrs
}

resource "aws_security_group_rule" "egress_backend_products" {
  from_port         = 0
  protocol          = -1
  security_group_id = aws_security_group.ecs_security_group_backend_products.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}