# iam
resource "aws_iam_role" "ecs_role_for_ecr" {
  name               = "${var.owner}-${var.environment}-ecs-role-for-ecr"
  assume_role_policy = file("${path.module}/ecs-assume-role.json")
}

resource "aws_iam_policy" "ecs_policy_for_ecr" {
  name   = "${var.owner}-${var.environment}-ecs-policy-for-ecr"
  policy = file("${path.module}/ecs-policy-ecr.json")
}

resource "aws_iam_role_policy_attachment" "ecs_policy_attachment_ecr" {
  policy_arn = aws_iam_policy.ecs_policy_for_ecr.arn
  role       = aws_iam_role.ecs_role_for_ecr.name
}

# Task Definition
resource "aws_ecs_task_definition" "ecs_task_definition_backend_users" {
  family             = "backend_users_task_def"
  network_mode       = "awsvpc"
  execution_role_arn = aws_iam_role.ecs_role_for_ecr.arn
  requires_compatibilities = [
  "FARGATE"]
  memory = 512
  cpu    = 256
  container_definitions = jsonencode([
    {
      name      = "ecs_service_backend_users"
      image     = "${var.users_repo_url}:latest"
      essential = true
      environment = [
        { name = "DB_HOST", value = var.rds_db_host },
        { name = "DB_PORT", value = var.rds_db_port },
        { name = "DB_NAME", value = var.rds_db_name },
        { name = "DB_USERNAME", value = var.rds_db_username },
        { name = "DB_PASSWORD", value = var.rds_db_password },
        { name = "PORT", value = var.rds_users_port }
      ]
      portMappings = [
        {
          containerPort = 3002
          hostPort      = 3002
        }
      ]
    }
  ])
}

# Service
resource "aws_ecs_service" "ecs_service_backend_users" {
  name            = "${var.owner}-${var.environment}-ecs-service-backend-users"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_definition_backend_users.arn
  desired_count   = 3
  launch_type     = "FARGATE"

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.backend_users_sg_id]
  }

  load_balancer {
    container_name   = "ecs_service_backend_users"
    container_port   = 3002
    target_group_arn = var.lb_backend_users_target_group_blue_arn
  }

  lifecycle {
    ignore_changes = [load_balancer, desired_count]
  }
}