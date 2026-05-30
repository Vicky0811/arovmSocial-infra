module "networking" {
  source = "../../modules/networking"

  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  common_tags           = local.common_tags
}

module "compute" {
  source = "../../modules/compute"

  project_name     = var.project_name
  environment      = var.environment
  instance_type    = var.instance_type
  allowed_ssh_cidr = var.allowed_ssh_cidr
  ec2_volume_size  = var.ec2_volume_size
  vpc_id           = module.networking.vpc_id
  public_subnet_id = module.networking.public_subnet_id
  common_tags      = local.common_tags
}

module "database" {
  source = "../../modules/database"

  project_name        = var.project_name
  environment         = var.environment
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  db_instance_class   = var.db_instance_class
  vpc_id              = module.networking.vpc_id
  private_subnet_id   = module.networking.private_subnet_id
  private_subnet_id_2 = module.networking.private_subnet_id_2
  ec2_sg_id           = module.compute.ec2_sg_id
  common_tags         = local.common_tags
}

module "storage" {
  source = "../../modules/storage"

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
}
