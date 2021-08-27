resource "aws_security_group" "ecs_security_group_backend_products" {
  name   = "${var.owner}-${var.environment}-ecs-security-group-backend-products"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.owner}-${var.environment}-ecs-security-group-backend-products"
  }
}