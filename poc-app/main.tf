# main.tf

provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

module "static_website" {
  source = "./modules/static_website"

  # Customize variables as needed
  bucket_name = "your-unique-bucket-name"
  index_document = "index.html"
  error_document = "error.html"
  cloudfront_aliases = ["your-custom-domain.com"]
}
