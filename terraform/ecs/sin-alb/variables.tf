variable "subnets" {
  description = "Subnets donde se desplegará el servicio ECS"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups para el servicio ECS"
  type        = list(string)
}

