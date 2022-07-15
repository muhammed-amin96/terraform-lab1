data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.lab1-public-subnet1.id
  security_groups = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.my-private-key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.lab1-private-subnet1.id
  security_groups = [aws_security_group.allow_ssh_and_open3000.id]
  key_name = aws_key_pair.my-private-key.key_name
  tags = {
    Name = "application"
  }
}