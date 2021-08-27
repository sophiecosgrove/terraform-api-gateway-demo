# application
resource "aws_codedeploy_app" "frontend_code_deploy_app" {
  compute_platform = "ECS"
  name             = "${var.owner}-${var.environment}-frontend-code-deploy-app"
}

# deployment group
resource "aws_codedeploy_deployment_group" "frontend_deployment_group" {
  app_name               = aws_codedeploy_app.frontend_code_deploy_app.name
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
  deployment_group_name  = "${var.owner}-${var.environment}-frontend-deployment-group"
  service_role_arn       = var.code_deploy_role_arn

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = var.cluster_name
    service_name = aws_ecs_service.ecs_service_frontend.name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.alb_frontend_listener_arn]
      }

      target_group {
        name = var.alb_frontend_target_group_blue_name
      }

      target_group {
        name = var.alb_frontend_target_group_green_name
      }
    }
  }
}