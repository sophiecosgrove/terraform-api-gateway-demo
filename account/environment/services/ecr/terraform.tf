terraform {
  required_providers {
    aws = {
      version = ">=3.22.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/ecr/terraform.tfstate"
    region = "eu-west-1"
    acl    = "bucket-owner-full-control"
  }
}