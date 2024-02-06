provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website" "static_website_config" {
  bucket = aws_s3_bucket.static_website.bucket

  index_document = "index.html"
  error_document = "error.html"
}

output "s3_bucket_domain_name" {
  value = aws_s3_bucket.static_website.bucket_regional_domain_name
}
