#create internet getway to vpc cluster
resource "aws_internet_gateway" "cluster-igw" {
  vpc_id = aws_vpc.vpc-cluster.id
  tags = {
    Name = "${var.environment_name}${var.name}-igw"
  }
}
