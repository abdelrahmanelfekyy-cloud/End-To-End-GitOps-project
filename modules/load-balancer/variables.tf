
variable "vpc_id" {
  description = "VPC ID where the target group will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}