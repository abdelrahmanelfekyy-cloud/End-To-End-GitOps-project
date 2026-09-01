
output "eks_cluster_sg_id" {
  description = "Security Group ID for EKS Control Plane"
  value       = aws_security_group.eks_cluster_sg.id
}

output "eks_nodes_sg_id" {
  description = "Security Group ID for EKS Worker Nodes"
  value       = aws_security_group.eks_nodes_sg.id
}

output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "rds_sg_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds_sg.id
}