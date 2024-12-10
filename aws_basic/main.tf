variable "aws_access_key" {
  default = "AKIATBRPP77VCQ632VGG"
}
variable "aws_secret_key" {
  default = "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"
}
variable "aws_ami" {
  default = "ami-0327f51db613d7bd2"
}
variable "aws_security_group_id" {
  default = "sg-0c450499f49b3f38e"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "kk1"
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
}
