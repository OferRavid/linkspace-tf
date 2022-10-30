
variable "cidr_block_vpc" {
  type = string
}

variable "cidr_block_route_table" {
  type = string
}

variable "name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "public-subnet-number" {
  type = number
}

variable "public_subnet_map_public_ip_on_launch" {
  type = bool
}

variable "private-subnet-number" {
  type = number
}
