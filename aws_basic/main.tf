variable "aws_access_key" {
  default = "AKIAUGO4KIYDMZLFAZF5"
}

variable "aws_secret_key" {
  default = "yE3LTpZeXuy+Luw332I0VygSHgbt1ebfi/l2p"
}

variable "aws_ami" {
  default = "ami-019d9dc96246b7eb9"  # Make sure this is a Windows AMI
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

  # User data script to configure the instance
  user_data = <<-EOF
              <powershell>
              # Create a new administrator user
              net user admin InterOP@6264 /add
              net localgroup administrators admin /add
              
              # Elastic Agent installation with --force flag
              $ProgressPreference = 'SilentlyContinue'
              Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.15.5-windows-x86_64.zip -OutFile elastic-agent-8.15.5-windows-x86_64.zip
              Expand-Archive .\elastic-agent-8.15.5-windows-x86_64.zip -DestinationPath . 
              cd elastic-agent-8.15.5-windows-x86_64
              .\elastic-agent.exe install --force
              </powershell>
              EOF

  # Ensure RDP is enabled and accessible
  associate_public_ip_address = true

  # Attach a 60GB EBS disk (using ebs_block_device for additional storage)
  ebs_block_device {
    device_name = "xvdf"   # Device name for Windows instance (typically xvdf)
    volume_size = 60       # Size in GB
    volume_type = "gp2"    # General Purpose SSD (gp2)
    delete_on_termination = true  # Ensure it is deleted when the instance is terminated
  }

  # Tags for the instance
  tags = {
    Name = "ElasticAgentInstance"
  }
}

# Optional: Output the Windows Admin password (AWS provides an encrypted password for Administrator user)
output "admin_password" {
  value = aws_instance.cda_instance.password_data
}

