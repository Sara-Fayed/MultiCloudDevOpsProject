# subnet_private.tf

variable "subnet_cidr_block" {}
variable "availability_zone" {}

resource "aws_subnet" "private" {
  vpc_id          = var.vpc_id
  cidr_block      = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

