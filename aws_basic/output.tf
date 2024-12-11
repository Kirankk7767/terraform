# Output the instance ID of the created EC2 instance
output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.cda_instance.id
}

# Output the public IP address of the created EC2 instance
output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.cda_instance.public_ip
}

# Output the private IP address of the created EC2 instance
output "private_ip" {
  description = "The private IP address of the created EC2 instance"
  value       = aws_instance.cda_instance.private_ip
}

# Output the public DNS of the created EC2 instance
output "public_dns" {
  description = "The public DNS of the created EC2 instance"
  value       = aws_instance.cda_instance.public_dns
}

# Output the instance state (running, stopped, etc.)
output "instance_state" {
  description = "The state of the created EC2 instance"
  value       = aws_instance.cda_instance.state
}

# Output the tags associated with the instance
output "instance_tags" {
  description = "The tags of the created EC2 instance"
  value       = aws_instance.cda_instance.tags
}

# Output the user data script for reference
output "user_data_script" {
  description = "The user data script for the EC2 instance"
  value       = aws_instance.cda_instance.user_data
}

# Optional: Output the Windows Admin password if available
output "admin_password" {
  description = "The Windows Administrator password for the instance"
  value       = aws_instance.cda_instance.password_data
}

# Output the instance AMI ID
output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.cda_instance.ami
}

# Output the security group ID associated with the instance
output "security_group_id" {
  description = "The security group ID of the EC2 instance"
  value       = aws_instance.cda_instance.vpc_security_group_ids
}

# Output the instance type used
output "instance_type" {
  description = "The instance type of the EC2 instance"
  value       = aws_instance.cda_instance.instance_type
}

# Output the EBS block device volume size
output "ebs_volume_size" {
  description = "The size of the EBS block device attached to the instance"
  value       = aws_instance.cda_instance.ebs_block_device[0].volume_size
}
