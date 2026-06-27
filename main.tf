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

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.my_test_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my_test_bucket_acl" {
    depends_on = [aws_s3_bucket_ownership_controls.ownership]
    bucket = aws_s3_bucket.my_test_bucket.id
    acl = "private"
}
resource "aws_s3_bucket_versioning"  "my_test_bucket_versioning" {
    bucket = aws_s3_bucket.my_test_bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_test_bucket_AES256" {
  bucket = aws_s3_bucket.my_test_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}