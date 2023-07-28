generate "partial_backend" {
  path = "terraform.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

remote_state {
  backend = "s3" 
  config = { 
    bucket = "terraform-state-bucket-kts-qa"
    key    = "us-west-2/${path_relative_to_include()}/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
    dynamodb_table = "terraform-state-lock"
  }
}