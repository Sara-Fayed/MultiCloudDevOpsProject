variable "instance_count" {
  description = "Number of EC2 instances to create"
}

variable "ami" {
  description = "ID of the AMI to use for the EC2 instances"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
}

variable "subnet_id" {
  description = "ID of the subnet where EC2 instances will be launched"
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with EC2 instances"
}

