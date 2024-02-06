output "website_url" {
  value = module.cloudfront.website_url
}

output "s3_bucket_domain_name" {
  value = module.s3.s3_bucket_domain_name
}
