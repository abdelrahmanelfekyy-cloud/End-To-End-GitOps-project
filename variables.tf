
variable "region" {
  description = "AWS Region"
  type        = string
}

variable "profile" {
  description = "AWS CLI Profile"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}



variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of Public Subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of Private Subnet CIDRs"
  type        = list(string)
}



variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes Version for EKS"
  type        = string
}

variable "node_group_name" {
  description = "Node Group Name"
  type        = string
}

variable "instance_types" {
  description = "Node Instance Types"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}



variable "db_secret_name" {
  description = "Secrets Manager Secret Name for DB credentials"
  type        = string
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "db_instance_class" {
  description = "RDS Instance Class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Storage Size in GB"
  type        = number
}

variable "db_engine_version" {
  description = "MySQL Version"
  type        = string
}