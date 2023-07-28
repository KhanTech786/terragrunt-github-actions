variable "account_id" {
  type = list(number)
}

variable "region" {}

variable "other_region" {
  default = ""
}

variable "tags" {
  type = map(any)
}

variable "ec2_ami" {
  description = "ec2-ami for west region"
  type        = string
  default     = ""
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}
