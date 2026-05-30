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
  description = "myapp vpc id"
}
variable "public_subnet_id" {
  type        = string
  description = "First public subnet ID"
}
variable "public_subnet_id_2" {
  type        = string
  description = "Second public subnet ID"
}
variable "common_tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
}
