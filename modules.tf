module "eks_network" {
  source = "./modules/network"

  cidr_block   = var.cidr_block
  project_name = var.project_name
}

module "eks_cluster" {
  source       = "./modules/cluster"
  project_name = var.project_name

  public_subnet_1a = module.eks_network.public_subnet_ids[0]
  public_subnet_1b = module.eks_network.public_subnet_ids[1]
  public_subnet_1c = module.eks_network.public_subnet_ids[2]
}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.private_subnet_ids[0]
  subnet_private_1b = module.eks_network.private_subnet_ids[1]
  subnet_private_1c = module.eks_network.private_subnet_ids[2]

  desired_size = 1
  min_size     = 1
  max_size     = 1
}

module "eks_aws_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  cluster_name = module.eks_cluster.cluster_name
  oidc         = module.eks_cluster.oidc
}
