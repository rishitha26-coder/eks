#########
## VPC ##
#########

variable "vpc_name" {
  type        = string
  description = "Name of the service"
  default     = null
}

variable "env_name" {
  type        = string
  description = "Deployment Environment"
  default     = null
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = null
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
  default     = null
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
  default     = null
}

variable "vpc_availability_zones" {
  type        = list(string)
  description = "List of availability zones for the VPC"
  default     = null
}

#########
## EKS ##
#########


variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Version of the EKS cluster"
  type        = string
}

variable "self_managed_node_group_defaults" {
  description = "Defaults for self-managed node group configuration"
  type        = object({
    instance_type                          = string
    update_launch_template_default_version = bool
    iam_role_additional_policies          = map(string)
  })
}

variable "eks_managed_node_group_defaults" {
  description = "Defaults for EKS managed node group configuration"
  type        = object({
    instance_types = list(string)
  })
}

variable "eks_managed_node_groups" {
  description = "Configuration for EKS managed node groups"
  type        = map(object({
    min_size       = number
    max_size       = number
    desired_size   = number
    instance_types = list(string)
    capacity_type  = string
  }))
}

variable "aws_auth_roles" {
  description = "List of AWS IAM roles for Kubernetes RBAC"
  type        = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "manage_aws_auth_configmap" {
  description = "Whether to manage the AWS auth ConfigMap in Kubernetes"
  type        = bool
}

variable "aws_auth_users" {
  description = "List of AWS IAM users for Kubernetes RBAC"
  type        = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}
