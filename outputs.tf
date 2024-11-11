output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "ec2_security_group_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ID of the EC2 security group"
}
