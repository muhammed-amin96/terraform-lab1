resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_ssh_and_open3000" {
  name        = "allow_ssh_and_3000"
  description = "Allow SSH inbound and open port 3000"
  vpc_id      = module.network.vpc_id

  ingress {
    description      = "SSH from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "Open port 3000"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_and_open3000"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "open port 3306 for rds"
  vpc_id      = module.network.vpc_id
  # Keep the instance private by only allowing traffic from the web server.
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags =  {
    Name = "rds_sg"
  }
}