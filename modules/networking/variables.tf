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

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = null
}

variable "cidr_block" {
  type        = string
  description = "CIDR for dev VPC"

  validation {
    condition     = can(cidrsubnet(var.cidr_block, 8, 0))
    error_message = "cidr_block must be a valid CIDR block"
  }
}

variable "public_ipv4_subnets" {
  type        = list(string)
  description = "A list of IPv4 CIDRs where each entry represents a public subnet to create in the VPC"

  validation {
    condition     = alltrue([for subnet in var.public_ipv4_subnets : regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", subnet) != null])
    error_message = "All items in public_ipv4_subnets must be valid CIDR blocks."
  }
}

variable "private_ipv4_subnets" {
  type        = list(string)
  description = "A list of IPv4 CIDRs where each entry represents a private subnet to create in the VPC"

  validation {
    condition     = alltrue([for subnet in var.private_ipv4_subnets : regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", subnet) != null])
    error_message = "All items in private_ipv4_subnets must be valid CIDR blocks."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances in the VPC"
  default     = "default"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC"
  default     = true
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Enable/Disable nat gateway in public subnets to enable internet access in private subnet"
}

variable "enable_ipv6_egw" {
  type        = bool
  default     = true
  description = "Enable/Disable Egress-only Gateway to enable internet access in private IPv6 subnet"
}

variable "enable_vpc_ipv6" {
  type        = bool
  default     = false
  description = "Enables IPv6 Support in the VPC"
}


