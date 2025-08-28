provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-public-bucket"
  acl    = "public-read"   # ❌ Security risk: public bucket
}
