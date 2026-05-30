output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the created VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "ID of the public subnet"
}
output "public_subnet_id_2" {
  value       = aws_subnet.public_2.id
  description = "ID of the public subnet 2"
}

output "private_subnet_id" {
  value       = aws_subnet.private_1.id
  description = "ID of the first private subnet"
}

output "private_subnet_id_2" {
  value       = aws_subnet.private_2.id
  description = "ID of the second private subnet"
}
