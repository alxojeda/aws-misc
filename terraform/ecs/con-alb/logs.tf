resource "aws_cloudwatch_log_group" "myappenv" {
  name              = "/ecs/myappenv"
  retention_in_days = 1
}

