output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.cda_instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.cda_instance.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.cda_instance.private_ip
}

output "instance_state" {
  description = "The state of the EC2 instance"
  value       = aws_instance.cda_instance.state
}

output "instance_ami" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.cda_instance.ami
}

output "instance_security_group_id" {
  description = "The security group ID associated with the EC2 instance"
  value       = aws_instance.cda_instance.vpc_security_group_ids
}

