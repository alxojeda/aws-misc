# ─── Elastic IP para el NAT Gateway ─────────
resource "aws_eip" "nat-ecsnetworking" {
  domain = "vpc"
  tags   = { Name = "eip-nat-ecsnetworking" }
}

# ─── NAT Gateway (vive en la subnet pública) ─────────────────────────────────
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat-ecsnetworking.id
  subnet_id     = var.public_subnet

  tags = { Name = "nat-gw-ecsnetworking" }

  depends_on = [var.igw]  # IGW existente
}

# ─── Subnet privada ──────────────────────────────────────────────────────────
resource "aws_subnet" "private-ecsnetworking" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.31.192.0/20"
  availability_zone = "us-east-1a"

  tags = { Name = "subnet-private-ecsnetworking" }
}

# ─── Route Table privada (tráfico saliente → NAT) ────────────────────────────
resource "aws_route_table" "private-ecsnetworking" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = { Name = "rt-private-ecsnetworking" }
}

# ─── Asociación subnet privada ↔ route table ─────────────────────────────────
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-ecsnetworking.id
  route_table_id = aws_route_table.private-ecsnetworking.id
}
