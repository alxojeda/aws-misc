resource "aws_cloudwatch_log_group" "ecs-sin-alb" {
  name              = "/ecs/sinalb"
  retention_in_days = 1
}
