resource "aws_route_table" "terraform-public-rtb" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
  tags = {
    Name = "terraform-public-rtb"
  }
}

resource "aws_route_table_association" "terraform-public-rtb-association1" {
  subnet_id      = aws_subnet.terraform-public-subnet1.id
  route_table_id = aws_route_table.terraform-public-rtb.id
}

resource "aws_route_table_association" "terraform-public-rtb-association2" {
  subnet_id      = aws_subnet.terraform-public-subnet2.id
  route_table_id = aws_route_table.terraform-public-rtb.id
}

resource "aws_route_table" "terraform-private-rtb" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform-nat-gateway.id
  }
  tags = {
    Name = "terraform-private-rtb"
  }
}

resource "aws_route_table_association" "terraform-private-rtb-association1" {
  subnet_id      = aws_subnet.terraform-private-subnet1.id
  route_table_id = aws_route_table.terraform-private-rtb.id
}
resource "aws_route_table_association" "terraform-private-rtb-association2" {
  subnet_id      = aws_subnet.terraform-private-subnet2.id
  route_table_id = aws_route_table.terraform-private-rtb.id
}