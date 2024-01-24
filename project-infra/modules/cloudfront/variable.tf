variable "region" {
  description = "AWS region"
}

variable "s3_bucket_domain_name" {
  description = "S3 bucket domain name"
}

variable "s3_bucket_origin_id" {
  description = "S3 bucket origin ID"
}

variable "cloudfront_aliases" {
  type        = list(string)
  description = "List of CloudFront aliases (CNAMEs)"
}
