# Correct way to define variables in Terraform
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  default     = "AKIAS66UC5HXPRC2YFFR"  # Replace with your actual access key
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = "1lPNy6nPAqfhX94XOOIz0UY0dmqYEpXJgXU+6rA1"  # Replace with your actual secret key
}

variable "aws_ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0327f51db613d7bd2"
}

variable "aws_security_group_id" {
  description = "The security group ID to associate with the instance"
  type        = string
  default     = "sg-0abc5537b410aa1a2"
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

# Provider block with access and secret keys
provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Resource block for the AWS EC2 instance
resource "aws_instance" "cda_instance" {
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.aws_security_group_id]
}
