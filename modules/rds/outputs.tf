
output "db_instance_id" {
  description = "RDS Instance ID"
  value       = aws_db_instance.mysql.id
}

output "db_instance_arn" {
  description = "RDS Instance ARN"
  value       = aws_db_instance.mysql.arn
}

output "db_instance_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "db_instance_address" {
  description = "RDS Address"
  value       = aws_db_instance.mysql.address
}

output "db_instance_port" {
  description = "RDS Port"
  value       = aws_db_instance.mysql.port
}

output "db_name" {
  description = "Database Name"
  value       = aws_db_instance.mysql.db_name
}

output "db_subnet_group" {
  description = "RDS Subnet Group Name"
  value       = aws_db_subnet_group.subnet_mysql.name
}