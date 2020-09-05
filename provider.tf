# we provision resources only in aws region which is defined by the variables
provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {}
}