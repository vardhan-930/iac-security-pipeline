terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Secure S3 bucket
resource "aws_s3_bucket" "secure" {
  bucket = "my-iac-demo-bucket-123456-unique"
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "secure" {
  bucket                  = aws_s3_bucket.secure.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "secure" {
  bucket = aws_s3_bucket.secure.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Optional: Versioning
resource "aws_s3_bucket_versioning" "secure" {
  bucket = aws_s3_bucket.secure.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Optional: Enforce HTTPS only (no plaintext)
resource "aws_s3_bucket_policy" "https_only" {
  bucket = aws_s3_bucket.secure.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "EnforceTLSRequestsOnly",
        Effect   = "Deny",
        Principal = "*",
        Action   = "s3:*",
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.secure.id}",
          "arn:aws:s3:::${aws_s3_bucket.secure.id}/*"
        ],
        Condition = {
          Bool = { "aws:SecureTransport" = "false" }
        }
      }
    ]
  })
}
