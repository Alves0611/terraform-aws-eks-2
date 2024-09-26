module "eks_network" {
  source = "./modules/network"

  cidr_block   = "10.0.0.0/16"
  aws_region   = "us-east-1"
  project_name = "eks"
}

