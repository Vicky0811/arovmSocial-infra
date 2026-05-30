output "rds_endpoint" {
  value       = aws_db_instance.myappdb.endpoint
  description = "RDS MySQL connection endpoint"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "RDS security group ID"
}
