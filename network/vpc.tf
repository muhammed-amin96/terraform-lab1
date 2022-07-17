resource "aws_vpc" "terraform-vpc" {
  cidr_block       = var.vpc_cidr 
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}