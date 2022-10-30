# Security group for network traffic to and from AWS EKS Cluster.
resource "aws_security_group" "eks-cluster-sg" {
  name   = "${var.environment_name}${var.name}-eks-cluster-sg"
  vpc_id = data.aws_vpc.cluster-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
