resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  # Add security group rules and other configuration here if needed
}

output "security_group_id" {
  value = aws_security_group.main.id
}

