variable "region" {
  type = string
  description = "Provide the region name"
}

variable "environment" {
    type = string
    description = "provide the environment name"
}

variable "project_name" {
  type = string
  description = "Provde the project name"
}

variable "cidr_block" {
  type = string
  description = "provide VPC cidr block"
}