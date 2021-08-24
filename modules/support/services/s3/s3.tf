resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.owner}-${var.environment}-bucket"
  acl    = "private"
  tags = {
    Name = "${var.owner}-${var.environment}-bucket"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}