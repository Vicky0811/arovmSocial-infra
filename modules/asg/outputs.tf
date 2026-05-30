output "asg_name" {
  value       = aws_autoscaling_group.main.name
  description = "Auto Scaling Group name"
}

output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "EC2 security group ID — needed by database module"
}

output "launch_template_id" {
  value       = aws_launch_template.main.id
  description = "Launch template ID"
}