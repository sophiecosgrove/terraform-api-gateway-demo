resource "aws_api_gateway_rest_api" "rest_api" {
  name = "${var.owner}-${var.environment}-rest-api"
  endpoint_configuration {
    types = [
    "PRIVATE"]
    vpc_endpoint_ids = [aws_vpc_endpoint.vpc_endpoint.id]
  }
}

resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = "${var.owner}-${var.environment}-vpc-link"
  target_arns = [var.private_load_balancer_arn]
}

resource "aws_api_gateway_rest_api_policy" "api_gateway_policy" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "execute-api:Invoke",
        "Resource": [
          "execute-api:/*"
        ]
      },
      {
        "Effect": "Deny",
        "Principal": "*",
        "Action": "execute-api:Invoke",
        "Resource": [
          "execute-api:/*"
        ],
        "Condition" : {
          "StringNotEquals": {
            "aws:SourceVpce": "${aws_vpc_endpoint.vpc_endpoint.id}"
          }
        }
      }
    ]
  }
EOF
}

resource "aws_api_gateway_deployment" "api_gateway_deployment" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.rest_api.body))
  }

  variables = {
    "version" = timestamp()
  }

  depends_on = [aws_api_gateway_integration.images_integration, aws_api_gateway_integration.products_integration, aws_api_gateway_integration.users_integration]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_gateway_stage" {
  deployment_id = aws_api_gateway_deployment.api_gateway_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  stage_name    = "deploy"
}

# Products
resource "aws_api_gateway_resource" "products_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "products"
}

resource "aws_api_gateway_method" "products_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.products_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_settings" "products_method_settings" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  stage_name  = aws_api_gateway_stage.api_gateway_stage.stage_name
  method_path = "${aws_api_gateway_resource.products_resource.path_part}/${aws_api_gateway_method.products_method.http_method}"

  settings {
    metrics_enabled = true
  }
}

resource "aws_api_gateway_integration" "products_integration" {
  http_method             = aws_api_gateway_method.products_method.http_method
  resource_id             = aws_api_gateway_resource.products_resource.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api.id
  type                    = "HTTP_PROXY"
  integration_http_method = "GET"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
  uri                     = "http://${var.internal_load_balancer_dns}:3001/products"

}

# Users
resource "aws_api_gateway_resource" "users_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "users"
}

resource "aws_api_gateway_method" "users_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.users_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_settings" "users_method_settings" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  stage_name  = aws_api_gateway_stage.api_gateway_stage.stage_name
  method_path = "${aws_api_gateway_resource.users_resource.path_part}/${aws_api_gateway_method.users_method.http_method}"

  settings {
    metrics_enabled = true
  }
}

resource "aws_api_gateway_integration" "users_integration" {
  http_method             = aws_api_gateway_method.users_method.http_method
  resource_id             = aws_api_gateway_resource.users_resource.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api.id
  type                    = "HTTP_PROXY"
  integration_http_method = "GET"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
  uri                     = "http://${var.internal_load_balancer_dns}:3002/users"

}

# Images
resource "aws_api_gateway_resource" "images_resource" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  parent_id   = aws_api_gateway_rest_api.rest_api.root_resource_id
  path_part   = "images"
}

resource "aws_api_gateway_method" "images_method" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.images_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method_settings" "images_method_setting" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  stage_name  = aws_api_gateway_stage.api_gateway_stage.stage_name
  method_path = "${aws_api_gateway_resource.images_resource.path_part}/${aws_api_gateway_method.images_method.http_method}"

  settings {
    metrics_enabled = true
  }
}

resource "aws_api_gateway_integration" "images_integration" {
  http_method             = aws_api_gateway_method.images_method.http_method
  resource_id             = aws_api_gateway_resource.images_resource.id
  rest_api_id             = aws_api_gateway_rest_api.rest_api.id
  type                    = "HTTP_PROXY"
  integration_http_method = "POST"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
  uri                     = "http://${var.internal_load_balancer_dns}:3001/images"

}