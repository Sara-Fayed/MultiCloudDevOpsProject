provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "./modules/vpc"
  # Add variables here if needed
}

module "subnet" {
  source  = "./modules/subnet"
  # Add variables here if needed
}

module "security_group" {
  source  = "./modules/security_group"
  # Add variables here if needed
}

module "ec2_instance" {
  source  = "./modules/ec2_instance"
  # Add variables here if needed
}

