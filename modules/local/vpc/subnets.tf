# a public and private subnet will be created in each availability zone in the chosen region
resource "aws_subnet" "private_subnets" {
  count             = var.az_limit
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(cidrsubnet(aws_vpc.vpc.cidr_block, 1, 0), var.az_limit, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name  = "${var.owner}-${var.environment}-private-subnet-${data.aws_availability_zones.available_zones.names[count.index]}"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = var.az_limit
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(cidrsubnet(aws_vpc.vpc.cidr_block, 1, 1), var.az_limit, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name   = "${var.owner}-${var.environment}-public-subnet-${data.aws_availability_zones.available_zones.names[count.index]}"
  }
}
