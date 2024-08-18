data "aws_ami" "ubuntu-linux-2204" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "network" {
  source               = "./modules/networking"
  vpc_name             = var.vpc_name
  env_name             = var.env_name
  cidr_block           = var.vpc_cidr_block
  public_ipv4_subnets  = var.vpc_public_subnets
  private_ipv4_subnets = var.vpc_private_subnets
  availability_zones   = var.vpc_availability_zones
}

module "eks" {
  source                         = "./modules/eks"
  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  vpc_id                           = module.network.id
  subnet_ids                       = module.network.private_subnet_ids
  control_plane_subnet_ids         = module.network.private_subnet_ids
  self_managed_node_group_defaults = var.self_managed_node_group_defaults
  eks_managed_node_group_defaults  = var.eks_managed_node_group_defaults
  eks_managed_node_groups          = var.eks_managed_node_groups
  manage_aws_auth_configmap        = var.manage_aws_auth_configmap
  aws_auth_roles                   = var.aws_auth_roles
  aws_auth_users                   = var.aws_auth_users
  aws_auth_accounts = [
    "533267416278",
  ]
}
