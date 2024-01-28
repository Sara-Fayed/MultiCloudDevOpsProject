# ec2_instance.tf

variable "instance_ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_name" {}

resource "aws_instance" "example" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_name]

  tags = {
    Name = "ExampleInstance"
  }
}

