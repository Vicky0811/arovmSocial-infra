variable "project_name" {
  type        = string
  description = "Project name for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from networking module"
}

variable "private_subnet_id" {
  type        = string
  description = "First private subnet ID"
}

variable "private_subnet_id_2" {
  type        = string
  description = "Second private subnet ID"
}

variable "ec2_sg_id" {
  type        = string
  description = "EC2 security group ID for RDS ingress rule"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_username" {
  type        = string
  description = "Database master username"
}

variable "db_password" {
  type        = string
  description = "Database master password"
  sensitive   = true
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
