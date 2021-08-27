resource "aws_db_instance" "rds_db" {
  allocated_storage      = var.storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = "${var.owner}${var.environment}"
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.owner}-${var.environment}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}