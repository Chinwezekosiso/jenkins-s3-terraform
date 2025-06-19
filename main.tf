provider "aws" {
    region = "eu-central-1"
}

resource "aws_s3_bucket" "examplebucket" {
    bucket = "cloudboosta-jenkins-bucket-ksc-20250619"

    tags  = {
      Name         = "Cloudboosta Jenkins S3 Bucket"
      Environment  = "Dev"
    }
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.examplebucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_bucket_encrption" {
  bucket = aws_s3_bucket.examplebucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
output "bucket_name" {
  value       = aws_s3_bucket.examplebucket.bucket
  description = "terraform_demo_bucket"
}