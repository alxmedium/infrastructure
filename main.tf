variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = "us-east-1"
  version    = "2.47.0"
}

resource "aws_iam_user" "alxmedium_circleci_iam_user" {
  name = "alxmedium_circleci"
  path = "/"
}

resource "aws_iam_user_policy" "alxmedium_circleci_iam_user_policy" {
  name   = "alxmedium_circleci"
  user   = aws_iam_user.alxmedium_circleci_iam_user.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:Get*",
                "iam:PutUserPolicy*"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}
