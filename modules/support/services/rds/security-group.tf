resource "aws_security_group" "db_security_group" {
  name = "${var.owner}-${var.environment}-rds-security-group"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.owner}-${var.environment}-rds-security-group"
  }
}

# create backend-users security group to allow access and avoid cyclic dependency
resource "aws_security_group" "ecs_security_group_backend_users" {
  name   = "${var.owner}-${var.environment}-ecs-security-group-backend-users"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.owner}-${var.environment}-ecs-security-group-backend-users"
  }
}