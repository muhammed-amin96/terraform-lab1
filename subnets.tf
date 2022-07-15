resource "aws_subnet" "lab1-public-subnet1" {
  vpc_id     = aws_vpc.lab1-vpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "terraform-public-subnet1"
  }
}

resource "aws_subnet" "lab1-public-subnet2" {
  vpc_id     = aws_vpc.lab1-vpc.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "terraform-public-subnet2"
  }
}

resource "aws_subnet" "lab1-private-subnet1" {
  vpc_id     = aws_vpc.lab1-vpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform-private-subnet1"
  }
}

resource "aws_subnet" "lab1-private-subnet2" {
  vpc_id     = aws_vpc.lab1-vpc.id
  availability_zone = "us-east-1b"
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "terraform-private-subnet2"
  }
}