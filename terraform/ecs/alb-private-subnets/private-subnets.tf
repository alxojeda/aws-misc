resource "aws_subnet" "private" {
  count             = length(var.private_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "private-${count.index}"
  }
}

