resource "aws_ecr_repository" "ecr_frontend_repo" {
  name = "${var.owner}-${var.environment}-ecr-frontend-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.owner}-${var.environment}-ecr-frontend-repo"
  }
}

resource "aws_ecr_repository" "ecr_users_repo" {
  name = "${var.owner}-${var.environment}-ecr-users-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.owner}-${var.environment}-ecr-users-repo"
  }
}

resource "aws_ecr_repository" "ecr_product_repo" {
  name = "${var.owner}-${var.environment}-ecr-product-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.owner}-${var.environment}-ecr-product-repo"
  }
}