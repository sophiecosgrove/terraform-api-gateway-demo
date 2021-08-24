provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Environment  = var.environment
      Owner        = var.owner
      Project      = "sophie-api-gateway-demo"
    }
  }
}