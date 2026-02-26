resource "aws_lb" "this" {
  name               = "ecs-alb"
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = [aws_security_group.alb.id]
}

