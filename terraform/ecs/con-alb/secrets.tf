resource "aws_secretsmanager_secret" "myappenv" {
  name        = "myappenv"
  description = "Secretos de la aplicación myapp en producción"
}

# Asignar el valor al secreto
resource "aws_secretsmanager_secret_version" "myappenv" {
  secret_id = aws_secretsmanager_secret.myappenv.id

  secret_string = jsonencode({
    entorno_1  = var.entorno_1
  })
}
