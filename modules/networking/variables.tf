variable "project_name" {
  type        = string
  description = "Project name for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}
variable "public_subnet_cidr_2" {
  type        = string
  description = "CIDR block for the public subnet"
}
variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the first private subnet"
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "CIDR block for the second private subnet"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
}
