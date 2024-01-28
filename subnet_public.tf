# subnet_public.tf

variable "subnet_cidr_block" {}
variable "availability_zone" {}

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
}

