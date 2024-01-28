# main.tf

provider "aws" {
  region = "us-east-1"  # Change the region as needed
}

module "vpc" {
  source          = "./vpc"
  vpc_cidr_block = "10.0.0.0/16"
}

module "public_subnet" {
  source             = "./subnet_public"
  vpc_id             = module.vpc.vpc_id
  subnet_cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Change availability zone as needed
}

module "private_subnet" {
  source             = "./subnet_private"
  vpc_id             = module.vpc.vpc_id
  subnet_cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"  # Change availability zone as needed
}

module "security_group" {
  source               = "./security_group"
  security_group_name = "app_security_group"
  vpc_id              = module.vpc.vpc_id
}

module "ec2_instance" {
  source              = "./ec2_instance"
  instance_ami        = "ami-12345678"  # Change AMI ID as per your requirement
  instance_type       = "t2.micro"
  subnet_id           = module.public_subnet.subnet_id
  security_group_name = module.security_group.security_group_name
}

