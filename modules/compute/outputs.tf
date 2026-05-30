output "ec2_public_ip" {
  value       = aws_instance.myapp_server.public_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_instance_id" {
  value       = aws_instance.myapp_server.id
  description = "EC2 instance ID"
}

output "ec2_sg_id" {
  value       = aws_security_group.myapp_sg.id
  description = "EC2 security group ID — needed by database module"
}
