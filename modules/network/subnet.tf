data "aws_availability_zones" "available" {
  state = "available"
}

#create subnet for node in cluster
resource "aws_subnet" "public-subnet" {
  count                   = var.public-subnet-number
  vpc_id                  = aws_vpc.vpc-cluster.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(var.cidr_block_vpc, 4, count.index)
  map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch

  tags = {
    Name = "${var.environment_name}${var.name}-public-subnet-${count.index}"
  }
}


resource "aws_subnet" "private-subnet" {
  count  = var.private-subnet-number
  vpc_id = aws_vpc.vpc-cluster.id
  # allow access to the availability_zones of the configured region
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.cidr_block_vpc, 4, count.index + var.public-subnet-number)

  tags = {
    Name = "${var.environment_name}${var.name}-private-subnet-${count.index}"
  }
}

