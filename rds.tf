resource "aws_db_subnet_group" "terraform_rds_subnet_group" {
  name        = "terraform_rds_subnet_group"
  subnet_ids  = [module.network.private_subnet1_id, module.network.private_subnet2_id]
}

resource "aws_db_instance" "terraform-rds" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "terraformdb"
  username             = "admin"
  password             = "admin12345"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.terraform_rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true
}