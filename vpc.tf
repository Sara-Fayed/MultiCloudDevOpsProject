# vpc.tf

variable "vpc_cidr_block" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
}

