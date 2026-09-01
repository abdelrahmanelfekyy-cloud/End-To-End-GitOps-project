
module "networking" {
  source = "./modules/networking"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}


module "security_group" {
  source = "./modules/security-group"

  vpc_id      = module.networking.vpc_id
  environment = var.environment
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  private_subnet_ids = module.networking.private_subnet_ids

  # EKS Control Plane SG
  cluster_sg_id = module.security_group.eks_cluster_sg_id

  # EKS Worker Node SG
  node_sg_id = module.security_group.eks_nodes_sg_id

  node_group_name = var.node_group_name
  instance_types  = var.instance_types

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size
}

module "rds" {
  source = "./modules/rds"

  db_name              = var.db_name
  db_secret_name       = var.db_secret_name
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_engine_version    = var.db_engine_version

  private_subnet_ids = module.networking.private_subnet_ids
  rds_sg_id          = module.security_group.rds_sg_id

  environment = var.environment
}

module "load_balancer" {
  source = "./modules/load-balancer"

  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id         = module.security_group.alb_sg_id
  environment       = var.environment
}

