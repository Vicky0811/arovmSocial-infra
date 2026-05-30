output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "ALB DNS name — used as CloudFront origin"
}

output "alb_arn" {
  value       = aws_lb.main.arn
  description = "ALB ARN"
}

output "target_group_arn" {
  value       = aws_lb_target_group.main.arn
  description = "Target group ARN — passed to ASG module"
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "ALB security group ID — ASG EC2s only accept traffic from this"
}