# database config
variable "storage" {
  type = number
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner" {
  type = string
}

variable "private_subnet_ids" {
  type = list(any)
}

variable "vpc_id" {
  type = string
}
