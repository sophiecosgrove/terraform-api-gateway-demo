# Security Group Rules for Backend Users Service
resource "aws_security_group_rule" "tcp_inbound_port_3002" {
  from_port         = 3002
  protocol          = "tcp"
  security_group_id = var.backend_users_sg_id
  to_port           = 3002
  type              = "ingress"
  cidr_blocks       = var.ip_cidrs
}

resource "aws_security_group_rule" "egress_backend_users" {
  from_port         = 0
  protocol          = -1
  security_group_id = var.backend_users_sg_id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}