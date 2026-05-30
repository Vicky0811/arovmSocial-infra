variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name for naming resources"
  default     = "myapp"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the first private subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "CIDR block for the second private subnet"
  default     = "10.0.3.0/24"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2_volume_size" {
  type        = number
  description = "Root volume size in GB"
  default     = 20
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH into EC2"
  default     = "0.0.0.0/0"
}

variable "db_name" {
  type        = string
  description = "RDS database name"
  default     = "myappdb"
}

variable "db_username" {
  type        = string
  description = "RDS master username"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "RDS master password — set via TF_VAR_db_password"
  sensitive   = true
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}
