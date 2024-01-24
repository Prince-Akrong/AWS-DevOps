# modules/static_website/main.tf

variable "bucket_name" {
  description = "The name of the S3 bucket for the static website"
}

variable "index_document" {
  description = "The index document for the static website"
}

variable "error_document" {
  description = "The error document for the static website"
}

variable "cloudfront_aliases" {
  description = "List of custom domain aliases for CloudFront distribution"
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}

resource "aws_cloudfront_distribution" "static_website" {
  origin {
    domain_name = aws_s3_bucket.static_website.website_endpoint
    origin_id   = aws_s3_bucket.static_website.bucket
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.index_document

  aliases = var.cloudfront_aliases

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.static_website.bucket

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    forwarded_values = {
      query_string = false
      cookies      = { forward = "none" }
    }

    min_ttl             = 0
    default_ttl         = 3600
    max_ttl             = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
