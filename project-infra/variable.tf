variable "region" {
  description = "AWS region"
}

variable "bucket_name" {
  description = "S3 bucket name"
}

variable "cloudfront_aliases" {
  type        = list(string)
  description = "List of CloudFront aliases (CNAMEs)"
}
