#create vpc for cluster

resource "aws_vpc" "vpc-cluster" {
  cidr_block = var.cidr_block_vpc
  tags = {
      Name = "${var.environment_name}${var.name}-vpc"
  }
}