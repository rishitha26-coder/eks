env_name               = "dev"
vpc_name               = "amgine"
vpc_cidr_block         = "10.0.0.0/16"
vpc_public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_private_subnets    = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
vpc_availability_zones = ["us-east-2a", "us-east-2b"]

# EKS
cluster_name = "Amgine_Dev"
cluster_version = "1.28"
self_managed_node_group_defaults = {
  instance_type                          = "t2.medium"
  update_launch_template_default_version = true
  iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

eks_managed_node_group_defaults = {
  instance_types = ["t2.medium", "t2.large"]
}

eks_managed_node_groups = {
  node_group_one = {
    min_size     = 1
    max_size     = 3
    desired_size = 1
    instance_types = ["t2.medium"]
    capacity_type  = "SPOT"
  }
  node_group_two = {
    min_size     = 1
    max_size     = 3
    desired_size = 1
    instance_types = ["t2.medium"]
    capacity_type  = "SPOT"
  }
}


manage_aws_auth_configmap = false
aws_auth_roles = [
  {
    rolearn  = "arn:aws:iam::533267416278:user/eks-admin"
    username = "eks-admin"
    groups   = ["system:masters"]
  },
  {
    rolearn  = "arn:aws:iam::533267416278:user/gaurav"
    username = "gaurav"
    groups   = ["system:nodes"]
  }
]
aws_auth_users = []