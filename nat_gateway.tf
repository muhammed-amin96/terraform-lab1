resource "aws_eip" "lab1-eip" {
  vpc = true
}

resource "aws_nat_gateway" "lab1-nat-gateway" {
  allocation_id = aws_eip.lab1-eip.id
  subnet_id = aws_subnet.lab1-public-subnet1.id
  tags = {
    "Name" = "terraform-nat-gateway"
  }
}