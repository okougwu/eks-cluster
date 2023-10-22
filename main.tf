provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "eks" {
  source = "./modules/eks"
  region = var.region
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}
