resource "tls_private_key" "my-private-key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "tf-private-key" {
  content = tls_private_key.my-private-key.private_key_pem
  filename = "tf-private.pem"
}

resource "aws_key_pair" "my-private-key" {
  key_name = "my-private-key"
  public_key = tls_private_key.my-private-key.public_key_openssh
}

resource "aws_secretsmanager_secret" "my-secret" {
  name = "my-secret2"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "my-secret" {
  secret_id = aws_secretsmanager_secret.my-secret.id
  secret_string = tls_private_key.my-private-key.private_key_pem
}