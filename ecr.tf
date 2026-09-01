resource "aws_ecr_repository" "ecr_app" {
  name = "${var.environment}-nodejs-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "${var.environment}-nodejs-app"
    Environment = var.environment
  }
}