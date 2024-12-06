variable "aws_access_key" {
  default = "AKIAW5WU5HR3GQP5BU7A"
}
variable "aws_secret_key" {
  default = "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"
}
variable "aws_ami" {
  default = "ami-0327f51db613d7bd2"
}
variable "aws_security_group_id" {
  default = "sg-049ad320eae569b8f"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "kk"
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
