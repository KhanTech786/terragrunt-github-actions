# provider "aws" {
#   region = var.region
#   # allowed_account_ids = [var.account_id]
# }

# terraform {
#   required_version = "~> 1.2"
# }
provider "aws" {
  alias = "usw2"
  allowed_account_ids = var.account_id
  region = var.region

    default_tags {
    tags = var.tags
  }

#   ignore_tags {
    
#   }

}

provider "aws" {
  alias = "use1"
  allowed_account_ids = var.account_id
  region = var.other_region

  default_tags {
    tags = var.tags
  }
#   ignore_tags {
    
#   }

}