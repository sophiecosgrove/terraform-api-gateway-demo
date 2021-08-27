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

data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = "sophie-demo-terraform-state"
    key    = "terraform/account/environment/services/rds/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_network_interfaces" "network_interfaces" {
  filter {
    name   = "description"
    values = ["ELB net/sophie-demo-internal-lb/*"]
  }
}

locals {
  nlb_interface_ids = flatten([data.aws_network_interfaces.network_interfaces.ids])
}

data "aws_network_interface" "ids" {
  count = length(local.nlb_interface_ids)
  id    = local.nlb_interface_ids[count.index]
}
