# Output the username created in the user_data script (Linux)
output "admin_username" {
  description = "The username of the newly created user"
  value       = "admin"
}

# Other outputs for instance details
output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.cda_instance_linux.ami
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.id
}

output "instance_state" {
  description = "The state of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.instance_state
}

output "instance_tags" {
  description = "The tags of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.tags
}

output "instance_type" {
  description = "The instance type of the EC2 instance"
  value       = aws_instance.cda_instance_linux.instance_type
}

output "public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.public_ip
}

output "private_ip" {
  description = "The private IP address of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.private_ip
}

output "public_dns" {
  description = "The public DNS of the created EC2 instance"
  value       = aws_instance.cda_instance_linux.public_dns
}

output "security_group_id" {
  description = "The security group ID of the EC2 instance"
  value       = aws_instance.cda_instance_linux.vpc_security_group_ids
}

output "ebs_volume_size" {
  description = "The size of the EBS block device attached to the instance"
  value       = [for ebs in aws_instance.cda_instance_linux.ebs_block_device : ebs.volume_size][0]
}
