variable "vpc_id" {}

variable "subnets" {
  description = "Subnets donde se desplegará el servicio ECS"
  type        = list(string)
}


