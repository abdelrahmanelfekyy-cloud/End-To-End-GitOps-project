
resource "aws_lb" "alb" {
  name               = "eks-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_sg_id
  ]

  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "eks-alb"
    Environment = var.environment
  }
}


resource "aws_lb_target_group" "tg" {
  name = "eks-target-group"

  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  # Kubernetes Pods will be registered by
  # AWS Load Balancer Controller
  target_type = "ip"

  deregistration_delay = 30

  health_check {
    enabled = true

    path     = "/"
    protocol = "HTTP"

    matcher = "200-399"

    interval = 30
    timeout  = 5

    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "eks-target-group"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.tg.arn
  }
}