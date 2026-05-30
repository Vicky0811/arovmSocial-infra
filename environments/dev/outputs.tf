output "vpc_id" {
  value       = module.networking.vpc_id
  description = "ID of the created VPC"
}

output "public_subnet_id" {
  value       = module.networking.public_subnet_id
  description = "ID of the public subnet"
}
output "public_subnet_id_2" {
  value       = module.networking.public_subnet_id_2
  description = "ID of the public subnet 2"
}

output "private_subnet_id" {
  value       = module.networking.private_subnet_id
  description = "ID of the first private subnet"
}
output "private_subnet_id_2" {
  value       = module.networking.private_subnet_id_2
  description = "ID of the first private subnet 2"
}

output "rds_endpoint" {
  value       = module.database.rds_endpoint
  description = "RDS MySQL connection endpoint"
}
output "rds_sg_id" {
  value       = module.database.rds_sg_id
  description = "RDS security group ID"
}
output "s3_bucket_name" {
  value       = module.storage.s3_bucket_name
  description = "Name of the media S3 bucket"
}
output "s3_bucket_id" {
  value       = module.storage.s3_bucket_id
  description = "S3 bucket ID for CloudFront OAC"
}

output "s3_bucket_arn" {
  value       = module.storage.s3_bucket_arn
  description = "S3 bucket ARN for bucket policy"
}

output "s3_bucket_regional_domain" {
  value       = module.storage.s3_bucket_regional_domain
  description = "S3 regional domain for CloudFront origin"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "ALB DNS name — used as CloudFront origin"
}

output "alb_arn" {
  value       = module.alb.alb_arn
  description = "ALB ARN"
}

output "target_group_arn" {
  value       = module.alb.target_group_arn
  description = "Target group ARN — passed to ASG module"
}

output "alb_sg_id" {
  value       = module.alb.alb_sg_id
  description = "ALB security group ID — ASG EC2s only accept traffic from this"
}

output "asg_name" {
  value       = module.asg.asg_name
  description = "Auto Scaling Group name"
}

output "ec2_sg_id" {
  value       = module.asg.ec2_sg_id
  description = "EC2 security group ID — needed by database module"
}

output "launch_template_id" {
  value       = module.asg.launch_template_id
  description = "Launch template ID"
}

output "cloudfront_domain" {
  value       = module.cdn.cloudfront_domain
  description = "CloudFront distribution domain name"
}

output "cloudfront_id" {
  value       = module.cdn.cloudfront_id
  description = "CloudFront distribution ID"
}