resource "aws_instance" "main" {
  count             = var.instance_count
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_group_ids = var.security_group_ids
  # Add other EC2 instance configuration here if needed
}

output "instance_ids" {
  value = aws_instance.main[*].id
}

