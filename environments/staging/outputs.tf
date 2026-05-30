output "vpc_id" {
  value       = module.networking.vpc_id
  description = "ID of the created VPC"
}

output "public_subnet_id" {
  value       = module.networking.public_subnet_id
  description = "ID of the public subnet"
}

output "private_subnet_id" {
  value       = module.networking.private_subnet_id
  description = "ID of the first private subnet"
}

output "ec2_public_ip" {
  value       = module.compute.ec2_public_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_instance_id" {
  value       = module.compute.ec2_instance_id
  description = "EC2 instance ID"
}

output "rds_endpoint" {
  value       = module.database.rds_endpoint
  description = "RDS MySQL connection endpoint"
}

output "s3_bucket_name" {
  value       = module.storage.s3_bucket_name
  description = "Name of the media S3 bucket"
}
