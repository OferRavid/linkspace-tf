region                                = "eu-north-1"
aws_eks_cluster_version               = "1.22"
name                                  = "linkspace-K8s"
environment_name                      = "dev-"
public-subnet-number                  = 2
private-subnet-number                 = 0
cidr_block_route_table                = "0.0.0.0/0"
cidr_block_vpc                        = "10.0.0.0/20"
public_subnet_map_public_ip_on_launch = true
nodes-group = {
  subnet_ids     = "public"
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]
  scaling_config = {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}
