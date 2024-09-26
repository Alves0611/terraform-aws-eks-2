module "eks_network" {
  source = "./modules/network"

  cidr_block   = var.cidr_block
  aws_region   = var.aws_region
  project_name = var.project_name
}

module "eks_cluster" {
  source = "./modules/cluster"

  aws_region   = var.aws_region
  project_name = var.project_name
}
