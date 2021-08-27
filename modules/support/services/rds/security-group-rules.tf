resource "aws_security_group_rule" "inbound_to_rds" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  source_security_group_id = aws_security_group.ecs_security_group_backend_users.id
  security_group_id = aws_security_group.db_security_group.id
}