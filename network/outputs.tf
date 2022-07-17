output vpc_id {
  value = aws_vpc.terraform-vpc.id
}

output public_subnet1_id {
  value = aws_subnet.terraform-public-subnet1.id
}

output public_subnet2_id {
  value = aws_subnet.terraform-public-subnet2.id
}

output private_subnet1_id {
  value = aws_subnet.terraform-private-subnet1.id
}

output private_subnet2_id {
  value = aws_subnet.terraform-private-subnet2.id
}