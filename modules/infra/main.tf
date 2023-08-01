resource "aws_instance" "my-terraforms-server" {
  provider      = aws.use1
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  tags = {
    CreatedBy = "Terragrunt"
    Name      = "khan-web-server-${var.region}"
  }
}


resource "aws_s3_bucket" "khans_tg_bucket" {
  bucket = "khans-tg-tf-bucket"
}