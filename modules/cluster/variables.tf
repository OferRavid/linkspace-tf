
variable "aws_eks_cluster_version" {
  type = string
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

}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "environment_name" {
  type    = string
}

variable "private-subnet-obj" {
  description = "provides a private subnet object from the output of network module"
}

variable "private-subnet-number" {
  type = number
}

variable "public-subnet-obj" {
  description = "provides a public subnet object from the output of network module"
}
variable "public-subnet-number" {
  type = number
}


