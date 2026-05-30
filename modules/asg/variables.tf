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
variable "ec2_volume_size" {
  type        = number
  description = "Root volume size in GB"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID from networking module"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID from networking module"
}
variable "public_subnet_id_2" {
  type        = string
  description = "Public subnet ID from networking module"
}
variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN"
}
variable "alb_sg_id" {
  type        = string
  description = "ALB SG ID — EC2 accepts traffic from ALB only"
}
variable "min_size" {
  type        = number
  description = "Minimum EC2 instances"
}
variable "max_size" {
  type        = number
  description = "Maximum EC2 instances"
}
variable "desired_capacity" {
  type        = number
  description = "Desired EC2 instances"
}
variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
