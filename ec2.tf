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
  instance_type = var.instance_type 
  subnet_id = module.network.public_subnet1_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.my-private-key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type 
  subnet_id = module.network.private_subnet1_id
  vpc_security_group_ids = [aws_security_group.allow_ssh_and_open3000.id]
  key_name = aws_key_pair.my-private-key.key_name
  tags = {
    Name = "application"
  }
}