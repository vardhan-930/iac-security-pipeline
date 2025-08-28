terraform {
  required_providers { aws = { source = "hashicorp/aws", version = "~> 5.0" } }
}
provider "aws" { region = "us-east-1" }

resource "aws_s3_bucket" "bad" {
  bucket = "my-iac-demo-bucket-123456"
  # Missing encryption/public access block to trigger Checkov
}
 # trigger Checkov
