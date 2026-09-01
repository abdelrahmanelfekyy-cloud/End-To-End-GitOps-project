
data "aws_secretsmanager_secret" "db" {
  name = var.db_secret_name
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}


locals {
  credentials = jsondecode(
    data.aws_secretsmanager_secret_version.db.secret_string
  )
}

resource "aws_db_subnet_group" "subnet_mysql" {
  name = "${var.db_name}-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.db_name}-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "mysql" {
  identifier = "mysql-rds"


  engine         = "mysql"
  engine_version = var.db_engine_version


  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  storage_type      = "gp3"

  db_name  = var.db_name
  username = local.credentials.username
  password = local.credentials.password

  
  db_subnet_group_name = aws_db_subnet_group.subnet_mysql.name

  vpc_security_group_ids = [
    var.rds_sg_id
  ]

  publicly_accessible = false

  multi_az = true
  backup_retention_period = 7
  apply_immediately = true
  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name        = "mysql-rds"
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

