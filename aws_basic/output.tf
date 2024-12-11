# Output the admin password directly (since you know it from the user data script)
output "adminn_password" {
  description = "The Windows Administrator password that was set in user_data"
  value       = "InterOP@6264"
}

# Output the username created in the user_data script
output "admin_username" {
  description = "The username of the newly created administrator"
  value       = "admin"
}

# Other outputs for instance details remain the same
output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.cda_instance.ami
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.cda_instance.id
}

output "instance_state" {
  description = "The state of the created EC2 instance"
  value       = aws_instance.cda_instance.instance_state
}

output "instance_tags" {
  description = "The tags of the created EC2 instance"
  value       = aws_instance.cda_instance.tags
}

output "instance_type" {
  description = "The instance type of the EC2 instance"
  value       = aws_instance.cda_instance.instance_type
}

output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.cda_instance.public_ip
}

output "private_ip" {
  description = "The private IP address of the created EC2 instance"
  value       = aws_instance.cda_instance.private_ip
}

output "public_dns" {
  description = "The public DNS of the created EC2 instance"
  value       = aws_instance.cda_instance.public_dns
}

output "security_group_id" {
  description = "The security group ID of the EC2 instance"
  value       = aws_instance.cda_instance.vpc_security_group_ids
}

output "ebs_volume_size" {
  description = "The size of the EBS block device attached to the instance"
  value       = [for ebs in aws_instance.cda_instance.ebs_block_device : ebs.volume_size][0]
}
