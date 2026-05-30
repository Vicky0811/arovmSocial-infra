module "networking" {
  source = "../../modules/networking"

  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  public_subnet_cidr_2  = var.public_subnet_cidr_2
  private_subnet_cidr   = var.private_subnet_cidr
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  common_tags           = local.common_tags
}

module "alb" {
  source = "../../modules/alb"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  public_subnet_id   = module.networking.public_subnet_id
  public_subnet_id_2 = module.networking.public_subnet_id_2
  common_tags        = local.common_tags
}

module "asg" {
  source = "../../modules/asg"

  project_name       = var.project_name
  environment        = var.environment
  instance_type      = var.instance_type
  ec2_volume_size    = var.ec2_volume_size
  allowed_ssh_cidr   = var.allowed_ssh_cidr
  vpc_id             = module.networking.vpc_id
  public_subnet_id   = module.networking.public_subnet_id
  public_subnet_id_2 = module.networking.public_subnet_id_2
  target_group_arn   = module.alb.target_group_arn
  alb_sg_id          = module.alb.alb_sg_id
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  common_tags        = local.common_tags
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
  ec2_sg_id           = module.asg.ec2_sg_id
  common_tags         = local.common_tags
}

module "storage" {
  source = "../../modules/storage"

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
}

module "cdn" {
  source = "../../modules/cdn"

  project_name              = var.project_name
  environment               = var.environment
  alb_dns_name              = module.alb.alb_dns_name
  s3_bucket_id              = module.storage.s3_bucket_id
  s3_bucket_arn             = module.storage.s3_bucket_arn
  s3_bucket_regional_domain = module.storage.s3_bucket_regional_domain
  common_tags               = local.common_tags
}