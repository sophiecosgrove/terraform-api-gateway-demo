resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name   = "${var.owner}-${var.environment}-nat-gateway-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name   = "${var.owner}-${var.environment}-nat-gateway"
  }
}