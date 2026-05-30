output "s3_bucket_name" {
  value       = aws_s3_bucket.media.bucket
  description = "Name of the media S3 bucket"
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.media.id
  description = "S3 bucket ID for CloudFront OAC"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.media.arn
  description = "S3 bucket ARN for bucket policy"
}

output "s3_bucket_regional_domain" {
  value       = aws_s3_bucket.media.bucket_regional_domain_name
  description = "S3 regional domain for CloudFront origin"
}
