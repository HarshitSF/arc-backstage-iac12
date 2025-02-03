locals {

  prefix = "${var.project_name}-${var.environment}"

  subnet_map = {
    "${local.prefix}-public-az1" = {
      name                    = "${local.prefix}-public-az1"
      cidr_block              = "172.32.0.0/19"
      availability_zone       = "ap-southeast-1a"
      nat_gateway_name        = "${local.prefix}-az1-ngtw01"
      attach_nat_gateway      = false
      create_nat_gateway      = true
      attach_internet_gateway = true
    },
    "${local.prefix}-public-az2" = {
      name                    = "${local.prefix}-public-az2"
      cidr_block              = "172.32.32.0/19"
      availability_zone       = "ap-southeast-1b"
      nat_gateway_name        = "${local.prefix}-az2-ngtw01"
      attach_nat_gateway      = false
      create_nat_gateway      = false
      attach_internet_gateway = true
    },
    "${local.prefix}-private-az1" = {
      name                    = "${local.prefix}-private-az1"
      cidr_block              = "172.32.64.0/19"
      availability_zone       = "ap-southeast-1a"
      nat_gateway_name        = "${local.prefix}-az1-ngtw01"
      attach_nat_gateway      = true
      create_nat_gateway      = false
      attach_internet_gateway = false
    },
    "${local.prefix}-private-az2" = {
      name                    = "${local.prefix}-private-az2"
      cidr_block              = "172.32.96.0/19"
      availability_zone       = "ap-southeast-1b"
      nat_gateway_name        = "${local.prefix}-az1-ngtw01"
      attach_nat_gateway      = true
      create_nat_gateway      = false
      attach_internet_gateway = false
    }
  }

}