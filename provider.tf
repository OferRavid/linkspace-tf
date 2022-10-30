
provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes {
	config_path = pathexpand(var.kube_config)
  }
}

terraform {
  backend "s3" {
    bucket  = "linkspace-backend-tf-state"
    key     = "terraform.tfstate"
    region  = var.region
    encrypt = true
  }
}

