resource "aws_iam_role" "task_role" {
  name               = "${var.owner}-${var.environment}-task-role"
  assume_role_policy = file("${path.module}/task-assume-role.json")
}

resource "aws_iam_policy" "task_policy" {
  name   = "${var.owner}-${var.environment}-task-policy"
  policy = file("${path.module}/task-policy-dynamodb-s3.json")
}

resource "aws_iam_role_policy_attachment" "task_policy_attachment" {
  policy_arn = aws_iam_policy.task_policy.arn
  role       = aws_iam_role.task_role.name
}
# Task Definition
resource "aws_ecs_task_definition" "ecs_task_definition_backend_products" {
  family             = "backend_products_task_def"
  network_mode       = "awsvpc"
  execution_role_arn = var.ecs_role_for_ecr_arn
  task_role_arn      = aws_iam_role.task_role.arn
  requires_compatibilities = [
  "FARGATE"]
  memory = 2048
  cpu    = 1024
  container_definitions = jsonencode([
    {
      name      = "ecs_service_backend_products"
      image     = "${var.product_repo_url}:latest"
      essential = true
      environment = [
        { name = "PORT", value = var.dynamodb_products_port },
        { name = "TABLE_NAME", value = var.dynamodb_table_name },
        { name = "BUCKET_NAME", value = var.s3_bucket_name },
        { name = "S3_BUCKET_REGION", value = var.s3_bucket_region }
      ]
      portMappings = [
        {
          containerPort = 3001
          hostPort      = 3001
        }
      ]
    }

  ])
}

# Service
resource "aws_ecs_service" "ecs_service_backend_products" {
  name            = "${var.owner}-${var.environment}-ecs-service-backend-products"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.ecs_task_definition_backend_products.arn
  desired_count   = 3
  launch_type     = "FARGATE"

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs_security_group_backend_products.id]
  }

  load_balancer {
    container_name   = "ecs_service_backend_products"
    container_port   = 3001
    target_group_arn = var.nlb_backend_products_target_group_blue_arn
  }

  lifecycle {
    ignore_changes = [load_balancer, desired_count]
  }
}
