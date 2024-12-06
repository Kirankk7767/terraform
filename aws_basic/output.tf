output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.cda_instance.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.cda_instance.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.cda_instance.private_ip
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.cda_instance.ami
}

output "instance_type" {
  description = "The instance type of the EC2 instance"
  value       = aws_instance.cda_instance.instance_type
}

output "security_group_ids" {
  description = "The security group IDs associated with the EC2 instance"
  value       = aws_instance.cda_instance.vpc_security_group_ids
}

output "key_name" {
  description = "The key pair name associated with the EC2 instance"
  value       = aws_instance.cda_instance.key_name
}
