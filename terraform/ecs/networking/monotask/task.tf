resource "aws_ecs_task_definition" "this" {
  family                   = "task-networking"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "2048"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "mi-app-front"
      image     = "366256582748.dkr.ecr.us-east-1.amazonaws.com/mi-app-front"
      essential = true

      portMappings = [
        {
          containerPort = 3000
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/networking"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs-networking"
        }
      }
    },
    {
      name      = "mi-app-back"
      image     = "366256582748.dkr.ecr.us-east-1.amazonaws.com/mi-app-back"
      essential = true

      portMappings = [
        {
          containerPort = 3001
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/networking"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs-networking"
        }
      }
    }
  ])
}
