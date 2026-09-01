
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS Kubernetes API"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_ca" {
  description = "Certificate Authority data of the EKS cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "node_group" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.nodes.node_group_name
}