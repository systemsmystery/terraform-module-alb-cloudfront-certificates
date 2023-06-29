provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "aws_us_east_1"
  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "aws_us_east_1_dns"
  assume_role {
    role_arn = "arn:aws:iam::395571296289:role/prod-route53-role"
  }
  default_tags {
    tags = var.tags
  }
}
