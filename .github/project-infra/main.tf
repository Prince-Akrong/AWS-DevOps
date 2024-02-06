# main.tf

provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

module "s3" {
  source          = "./modules/s3"
  region          = "us-east-1"  # Change this to your desired AWS region
  bucket_name     = "project-poc-bucket.com"  # Change this to a globally unique bucket name
}

module "cloudfront" {
  source                = "./modules/cloudfront"
  region                = "us-east-1"  # Change this to your desired AWS region
  s3_bucket_domain_name = module.s3.s3_bucket_domain_name
  s3_bucket_origin_id   = module.s3.static_website_bucket_regional_domain_name
  cloudfront_aliases    = ["pocproject_staticwebsite.com"]  # Change this to your desired domain name
}
