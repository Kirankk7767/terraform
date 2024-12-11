variable "aws_access_key" {
  default = "AKIATBRPP77VCQ632VGG"
}

variable "aws_secret_key" {
  default = "34vVeYy8PWCRvmmSdGvjd+dD41jThtwp7F9SSCBT"
}

variable "aws_ami" {
  default = "ami-016028889ceebfc33"  # Make sure this is a Windows AMI
}

variable "aws_security_group_id" {
  default = "sg-0c450499f49b3f38e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "kk1"  # For SSH key, we can ignore it if we want to use RDP
}

provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "cda_instance" {
  ami                    = var.aws_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.aws_security_group_id]
  key_name               = var.key_name

  user_data = <<-EOF
              <powershell>
              # Create a new administrator user
              net user admin InterOP@6264 /add
              net localgroup administrators admin /add
              </powershell>
              EOF

  # Ensure RDP is enabled and accessible
  associate_public_ip_address = true
}

# Optional: Output the Windows Admin password (AWS provides an encrypted password for Administrator user)
output "admin_password" {
  value = aws_instance.cda_instance.password_data
}

