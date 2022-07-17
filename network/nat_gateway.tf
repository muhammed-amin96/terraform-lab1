resource "aws_eip" "lab1-eip" {
  vpc = true
}

resource "aws_nat_gateway" "terraform-nat-gateway" {
  allocation_id = aws_eip.lab1-eip.id
  subnet_id = aws_subnet.terraform-public-subnet1.id
  tags = {
    "Name" = "terraform-nat-gateway"
  }
}