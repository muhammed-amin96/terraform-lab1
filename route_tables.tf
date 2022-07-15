resource "aws_route_table" "lab1-public-rtb" {
  vpc_id = aws_vpc.lab1-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab1-igw.id
  }
  tags = {
    Name = "terraform-public-rtb"
  }
}

resource "aws_route_table_association" "lab1-public-rtb-association1" {
  subnet_id      = aws_subnet.lab1-public-subnet1.id
  route_table_id = aws_route_table.lab1-public-rtb.id
}

resource "aws_route_table_association" "lab1-public-rtb-association2" {
  subnet_id      = aws_subnet.lab1-public-subnet2.id
  route_table_id = aws_route_table.lab1-public-rtb.id
}

resource "aws_route_table" "lab1-private-rtb" {
  vpc_id = aws_vpc.lab1-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.lab1-nat-gateway.id
  }
  tags = {
    Name = "terraform-private-rtb"
  }
}

resource "aws_route_table_association" "lab1-private-rtb-association1" {
  subnet_id      = aws_subnet.lab1-private-subnet1.id
  route_table_id = aws_route_table.lab1-private-rtb.id
}
resource "aws_route_table_association" "lab1-private-rtb-association2" {
  subnet_id      = aws_subnet.lab1-private-subnet2.id
  route_table_id = aws_route_table.lab1-private-rtb.id
}