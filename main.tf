module "network" {
  source                                = "./modules/network"
  name                                  = var.name
  environment_name                      = var.environment_name
  cidr_block_vpc                        = var.cidr_block_vpc
  cidr_block_route_table                = var.cidr_block_route_table
  public_subnet_map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch
  public-subnet-number                  = var.public-subnet-number
  private-subnet-number                 = var.private-subnet-number
}
module "cluster" {
  source = "./modules/cluster"
  depends_on = [
    module.network
  ]
  aws_eks_cluster_version = var.aws_eks_cluster_version
  name                    = var.name
  environment_name        = var.environment_name
  region                  = var.region
  nodes-group             = var.nodes-group
  private-subnet-obj      = module.network.output-private-subnet-obj
  public-subnet-obj       = module.network.output-public-subnet-obj
  public-subnet-number    = var.public-subnet-number
  private-subnet-number   = var.private-subnet-number
}

module "helm" {
  source = "./modules/helm"
  depends_on = [module.cluster]
}
