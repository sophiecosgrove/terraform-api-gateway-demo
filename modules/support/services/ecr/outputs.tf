output "frontend_repo_url" {
  value = aws_ecr_repository.ecr_frontend_repo.repository_url
}

output "users_repo_url" {
  value = aws_ecr_repository.ecr_users_repo.repository_url
}

output "product_repo_url" {
  value = aws_ecr_repository.ecr_product_repo.repository_url
}

