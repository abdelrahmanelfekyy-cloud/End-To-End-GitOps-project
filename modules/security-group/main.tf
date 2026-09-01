
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "EKS Control Plane Security Group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "eks-cluster-sg"
    Environment = var.environment
  }
}



resource "aws_security_group" "eks_nodes_sg" {
  name        = "eks-nodes-sg"
  description = "EKS Worker Nodes Security Group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "eks-nodes-sg"
    Environment = var.environment
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Application Load Balancer Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "alb-sg"
    Environment = var.environment
  }
}



resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "RDS MySQL Security Group"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "rds-sg"
    Environment = var.environment
  }
}



resource "aws_vpc_security_group_ingress_rule" "cluster_from_nodes" {
  security_group_id            = aws_security_group.eks_cluster_sg.id
  referenced_security_group_id = aws_security_group.eks_nodes_sg.id

  from_port = 443
  to_port   = 443
  ip_protocol = "tcp"
}



resource "aws_vpc_security_group_ingress_rule" "nodes_from_cluster" {
  security_group_id            = aws_security_group.eks_nodes_sg.id
  referenced_security_group_id = aws_security_group.eks_cluster_sg.id

  from_port   = 1025
  to_port     = 65535
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "nodes_from_nodes" {
  security_group_id            = aws_security_group.eks_nodes_sg.id
  referenced_security_group_id = aws_security_group.eks_nodes_sg.id

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "nodes_from_alb" {
  security_group_id            = aws_security_group.eks_nodes_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id

  from_port   = 30000
  to_port     = 32767
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "rds_from_nodes" {
  security_group_id            = aws_security_group.rds_sg.id
  referenced_security_group_id = aws_security_group.eks_nodes_sg.id

  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"
}