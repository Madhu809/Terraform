terraform {
  backend "s3" {
    bucket = "terraform-project-bucket-madhun21"
    key    = "defaults/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = Enabled
  }
}
