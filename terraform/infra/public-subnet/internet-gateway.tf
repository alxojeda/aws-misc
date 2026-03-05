resource "aws_internet_gateway" "igw-pub" {
  vpc_id = aws_vpc.dos.id

  tags = {
    Name = "igw-pub"
  }
}
