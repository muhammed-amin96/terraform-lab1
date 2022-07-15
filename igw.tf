resource "aws_internet_gateway" "lab1-igw" {
  vpc_id = aws_vpc.lab1-vpc.id

  tags = {
    Name = "terraform-igw"
  }
}