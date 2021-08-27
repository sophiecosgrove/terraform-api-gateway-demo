output "rds_db_address" {
  value = aws_db_instance.rds_db.address
}

output "rds_db_name" {
  value = aws_db_instance.rds_db.name
}

output "backend_users_sg_id" {
  value = aws_security_group.ecs_security_group_backend_users.id
}