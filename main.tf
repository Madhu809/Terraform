provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = var.instance_type

  tags = {
    Name        = "web-server"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "terraform-project-bucket-madhun21"

}