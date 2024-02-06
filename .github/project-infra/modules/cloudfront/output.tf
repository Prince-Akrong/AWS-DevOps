output "website_url" {
  value = aws_cloudfront_distribution.static_website_cdn.domain_name
}
