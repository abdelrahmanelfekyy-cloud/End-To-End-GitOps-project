variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EKS"
}

variable "cluster_sg_id" {
  type        = string
  description = "Security group ID for EKS control plane"
}

variable "node_sg_id" {
  type        = string
  description = "Security group ID for EKS worker nodes"
}

variable "node_group_name" {
  type        = string
  description = "Name of the EKS node group"
}

variable "instance_types" {
  type        = list(string)
  description = "EC2 instance types for worker nodes"
}

variable "desired_size" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "min_size" {
  type        = number
  description = "Minimum number of worker nodes"
}

variable "max_size" {
  type        = number
  description = "Maximum number of worker nodes"
}