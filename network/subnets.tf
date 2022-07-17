resource "aws_subnet" "terraform-public-subnet1" {
  vpc_id     = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}a"
  cidr_block = var.public_subnet1_cidr

  tags = {
    Name = "terraform-public-subnet1"
  }
}

resource "aws_subnet" "terraform-public-subnet2" {
  vpc_id     = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}b"
  cidr_block = var.public_subnet2_cidr

  tags = {
    Name = "terraform-public-subnet2"
  }
}

resource "aws_subnet" "terraform-private-subnet1" {
  vpc_id     = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}a"
  cidr_block = var.private_subnet1_cidr 

  tags = {
    Name = "terraform-private-subnet1"
  }
}

resource "aws_subnet" "terraform-private-subnet2" {
  vpc_id     = aws_vpc.terraform-vpc.id
  availability_zone = "${var.region}b"
  cidr_block = var.private_subnet2_cidr 

  tags = {
    Name = "terraform-private-subnet2"
  }
}