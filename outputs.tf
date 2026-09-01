
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.networking.private_subnet_ids
}


output "rds_endpoint" {
  description = "Connection endpoint for the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "rds_address" {
  description = "Hostname of the RDS instance"
  value       = module.rds.db_instance_address
}

output "rds_port" {
  description = "Port number for RDS MySQL"
  value       = module.rds.db_instance_port
}

output "rds_database" {
  description = "Name of the created database"
  value       = module.rds.db_name
}

output "alb_dns_name" {
  description = "Public DNS name of the ALB"
  value       = module.load_balancer.alb_dns_name
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = module.load_balancer.alb_arn
}


output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ecr_app.repository_url
}



output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for EKS Kubernetes API"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca" {
  description = "Certificate Authority data for EKS cluster"
  value       = module.eks.cluster_ca
}

output "eks_node_group" {
  description = "EKS node group name"
  value       = module.eks.node_group
}