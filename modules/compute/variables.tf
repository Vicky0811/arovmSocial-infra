variable "project_name" {
  type        = string
  description = "Project name for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH into EC2"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID from networking module"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID from networking module"
}

variable "ec2_volume_size" {
  type        = number
  description = "Root volume size in GB"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
