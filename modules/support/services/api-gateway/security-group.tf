resource "aws_security_group" "vpc_endpoint_sg" {
  vpc_id = var.vpc_id
  name   = "${var.owner}-${var.environment}-vpc-endpoint-sg"
}

