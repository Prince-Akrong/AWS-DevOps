provider "aws" {
  region = var.region
}

resource "aws_cloudfront_origin_access_identity" "static_website_access_identity" {}

resource "aws_cloudfront_distribution" "static_website_cdn" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = var.s3_bucket_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.static_website_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = var.s3_bucket_origin_id

    viewer_protocol_policy = "redirect-to-https"
    min_ttl               = 0
    default_ttl           = 3600
    max_ttl               = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  aliases = var.cloudfront_aliases

  price_class = "PriceClass_100"
}

output "website_url" {
  value = aws_cloudfront_distribution.static_website_cdn.domain_name
}
