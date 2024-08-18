# output "vpc_id" {
#   description = "ID of the created VPC in the na dev environment"
#   value       = module.network.id
# }

# output "vpc_cidr_block" {
#   description = "CIDR block of the created VPC in the na dev environment"
#   value       = module.network.cidr_block
# }

# output "public_subnet_ids" {
#   description = "IDs of the public subnets in the created VPC in the na dev environment"
#   value       = module.network.public_subnet_ids
# }

# output "private_subnet_ids" {
#   description = "IDs of the private subnets in the created VPC in the na dev environment"
#   value       = module.network.private_subnet_ids
# }

# #################### EKS ####################

# output "cluster_id" {
#     value = module.eks.cluster_id
# }

# output "cluster_name" {
#     value = module.eks.cluster_name 
# }

# output "oidc_provider_arn" {
#     value = module.eks.oidc_provider_arn
# }