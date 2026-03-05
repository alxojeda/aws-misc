resource "aws_cloudwatch_log_group" "ecs-networking" {
  name              = "/ecs/networking"
  retention_in_days = 1
}
