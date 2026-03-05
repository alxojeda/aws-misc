
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.dos.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-pub.id
  }

  tags = {
    Name = "public-route-table"
  }
}
