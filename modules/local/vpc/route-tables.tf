resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name  = "${var.owner}-${var.environment}-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count          = var.az_limit
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_subnets[count.index].id
}

resource "aws_route" "outbound_to_nat" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name   = "${var.owner}-${var.environment}-public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = var.az_limit
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

resource "aws_route" "outbound_to_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}