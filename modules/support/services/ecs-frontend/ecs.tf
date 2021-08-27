# task definition
resource "aws_ecs_task_definition" "ecs_task_definition_frontend" {
  family             = "frontend_task_def"
  network_mode       = "awsvpc"
  execution_role_arn = var.ecs_role_for_ecr_arn
  requires_compatibilities = [
  "FARGATE"]
  memory = 2048
  cpu    = 1024
  container_definitions = jsonencode([
    {
      name      = "ecs_service_frontend"
      image     = "${var.frontend_repo_url}:latest"
      essential = true
      environment = [
        { name = "PRODUCT_API_URL", value = "${var.api_url}deploy" },
        { name = "USER_API_URL", value = "${var.api_url}deploy" }
      ]
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}



# service
resource "aws_ecs_service" "ecs_service_frontend" {
  name            = "${var.owner}-${var.environment}-ecs-service-frontend"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_definition_frontend.arn
  desired_count   = 3
  launch_type     = "FARGATE"

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.frontend_sg_id]
  }

  load_balancer {
    container_name   = "ecs_service_frontend"
    container_port   = 3000
    target_group_arn = var.alb_frontend_target_group_blue_arn
  }

  lifecycle {
    ignore_changes = [load_balancer, desired_count]
  }
}




