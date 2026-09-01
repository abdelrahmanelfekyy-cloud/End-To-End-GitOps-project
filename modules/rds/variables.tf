
variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_secret_name" {
  description = "Secrets Manager secret name"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for RDS"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "Security Group ID for RDS"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}