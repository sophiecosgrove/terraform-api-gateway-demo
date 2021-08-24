data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/infrastructure/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}