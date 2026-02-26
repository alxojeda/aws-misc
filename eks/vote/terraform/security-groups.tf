resource "aws_security_group" "eks_nodes" {
  name        = "eks-nodes-nodeport-sg"
  description = "Security Group para nodos EKS con NodePort y SSH abiertos a Internet (LAB)"
  vpc_id      = var.vpc_id

  # --------------------
  # NodePort (abierto a Internet)
  # --------------------
  ingress {
    description = "NodePort desde Internet"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # --------------------
  # Salida libre
  # --------------------
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-nodes-nodeport-lab"
  }
}
