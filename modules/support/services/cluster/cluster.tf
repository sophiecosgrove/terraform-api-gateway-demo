resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.owner}-${var.environment}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}