# application load balancer security group
resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id
  name   = "${var.owner}-${var.environment}-alb-sg"

  tags = {
    Name = "${var.owner}-${var.environment}-alb-sg"
  }
}

# frontend security group to avoid cyclic dependency
resource "aws_security_group" "frontend_app_sg" {
  name   = "${var.owner}-${var.environment}-ecs-frontend-sg"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.owner}-${var.environment}-ecs-frontend-sg"
  }
}