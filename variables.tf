
variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
variable "region" {
  type    = string
  default = "eu-north-1"
}
variable "aws_eks_cluster_version" {
  type    = string
  default = "1.22"
}
variable "cidr_block_vpc" {
  type    = string
  default = "10.0.0.0/20"
}

variable "cidr_block_route_table" {
  type    = string
  default = "0.0.0.0/0"
}

variable "name" {
  type    = string
  default = "linkspace-K8s"
}

variable "environment_name" {
  type    = string
  default = ""
}

variable "public-subnet-number" {
  type    = number
  default = 2
}
variable "private-subnet-number" {
  type    = number
  default = 0
}
variable "public_subnet_map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "nodes-group" {
  type = object({
    subnet_ids     = string
    capacity_type  = string
    instance_types = list(string)
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  })
  default = {
    subnet_ids     = "public"
    capacity_type  = "ON_DEMAND"
    instance_types = ["t3.medium"]
    scaling_config = {
      desired_size = 3
      max_size     = 5
      min_size     = 1
    }
  }
}
