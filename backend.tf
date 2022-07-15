terraform {
  backend "s3" {
    bucket = "state-bucket-iti"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
