######################################################################
## data lookup
######################################################################
data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.eks_cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.eks_cluster_id
}


# fetching network details
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_name}-${var.environment}-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"

    values = ["*private*"]
  }
  filter {
    name = "tag:Project"

    values = ["${var.project_name}"]
  }
}

data "aws_subnets" "public" {
  filter {
    name = "tag:Type"

    values = ["*public*"]
  }
  filter {
    name = "tag:Project"

    values = ["${var.project_name}"]
  }
}