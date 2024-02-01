resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  # Add other VPC configuration here if needed
}

output "vpc_id" {
  value = aws_vpc.main.id
}

