data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/infrastructure/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "ecr" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/ecr/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "load_balancers" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/load-balancers/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/cluster/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "code_deploy" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/code-deploy/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "backend_users" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/ecs-backend-users/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "api_gateway" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/api-gateway/terraform.tfstate"
    region = "eu-west-1"
  }
}
