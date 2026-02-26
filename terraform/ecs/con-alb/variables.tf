variable "vpc_id" {}

variable "subnets" {
  description = "Subnets donde se desplegará el servicio ECS"
  type        = list(string)
}

variable "entorno_1" {
  description = "Variable de entorno sensible 1"
  type        = string
  sensitive   = true  # Terraform no la muestra en los logs ni en el plan
}

