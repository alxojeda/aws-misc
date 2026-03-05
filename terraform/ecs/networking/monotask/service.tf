resource "aws_ecs_service" "this" {
  name            = "service-networking"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.sgback.id]
    assign_public_ip = true
  }
}
