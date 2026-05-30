variable "project_name" {
  type        = string
  description = "Project name for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "alb_dns_name" {
  type        = string
  description = "ALB DNS name — CloudFront origin 1"
}

variable "s3_bucket_id" {
  type        = string
  description = "S3 bucket ID — CloudFront origin 2"
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 bucket ARN — for bucket policy"
}
variable "s3_bucket_regional_domain" {
  type        = string
  description = "S3 regional domain name for CloudFront origin"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags for all resources"
}
