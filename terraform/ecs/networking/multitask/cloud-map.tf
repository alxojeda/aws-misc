# Namespace: dominio interno que usarán los servicios
resource "aws_service_discovery_private_dns_namespace" "main" {
  name = "services.local"
  vpc  = var.vpc_id
}

# Servicio de descubrimiento
resource "aws_service_discovery_service" "api" {
  name = "api"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.main.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}


