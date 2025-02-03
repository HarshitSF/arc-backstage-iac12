################################################################
## tags
################################################################
module "tags" {
  source  = "sourcefuse/arc-tags/aws"
  version = "1.2.7"

  environment = var.environment
  project     = var.project_name

  extra_tags = {
    To_Be_Deleted = "True"
  }
}

################################################################
## network
################################################################
module "network" {
  source = "sourcefuse/arc-network/aws"
  version = "3.0.1"

  namespace   = var.project_name
  environment = var.environment

  name                    = "${var.project_name}-${var.environment}-vpc"
  create_internet_geteway = true
  subnet_map              = local.subnet_map
  cidr_block              = var.cidr_block

  vpc_flow_log_config = {
    enable            = true
    retention_in_days = 7
    s3_bucket_arn     = null
  }

  tags = module.tags.tags
}