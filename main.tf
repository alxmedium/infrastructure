variable "aws_profile_name" {
  type = string
}


provider "aws" {
  profile = var.aws_profile_name
  region  = "us-east-1"
  version = "2.47.0"
}