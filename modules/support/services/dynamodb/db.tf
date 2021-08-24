resource "aws_dynamodb_table" "dynamodb_table" {
  hash_key     = var.hash_key
  name         = "${var.owner}-${var.environment}-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = var.hash_key
    type = "N"
  }
}