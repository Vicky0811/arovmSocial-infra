variable "project_name" {
  type        = string
  description = "Project name for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
