output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.main.domain_name
  description = "CloudFront distribution domain name"
}

output "cloudfront_id" {
  value       = aws_cloudfront_distribution.main.id
  description = "CloudFront distribution ID"
}