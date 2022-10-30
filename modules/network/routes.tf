#create route table to igw
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc-cluster.id
  route {
    cidr_block = var.cidr_block_route_table
    gateway_id = aws_internet_gateway.cluster-igw.id
  }
  tags = {
    Name = "${var.environment_name}${var.name}-public-rt"
  }
}
#connect route tabel to vpc
resource "aws_main_route_table_association" "cluster-rt" {
  vpc_id         = aws_vpc.vpc-cluster.id
  route_table_id = aws_route_table.public.id
}
