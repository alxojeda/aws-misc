resource "aws_ecs_service" "back" {
  name            = "service-back"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app-back.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.private-ecsnetworking.id]
    security_groups = [aws_security_group.sgback.id]
    # assign_public_ip = true
  }

  service_registries {
    registry_arn = aws_service_discovery_service.api.arn
  }

}

resource "aws_ecs_service" "front" {
  name            = "service-front"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.app-front.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [var.public_subnet]
    security_groups = [aws_security_group.sgfront.id]
    assign_public_ip = true
  }
}
