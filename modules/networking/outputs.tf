output "id" {
  value       = aws_vpc.vpc.id
  description = "VPC ID"
}

# output "availability_zones" {
#   value = aws_vpc.vpc.availability_zones
# }


output "cidr_block" {
  value       = aws_vpc.vpc.cidr_block
  description = "VPC CIDR block"
}

output "ipv6_cidr_block" {
  value       = var.enable_vpc_ipv6 ? aws_vpc.vpc.ipv6_cidr_block : null
  description = "VPC IPv6 CIDR block"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "VPC public subnet ids"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "VPC private subnet ids"
}

output "vpc_public_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = aws_route_table.public.id
}

output "vpc_private_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = aws_route_table.private_nat[*].id
}

