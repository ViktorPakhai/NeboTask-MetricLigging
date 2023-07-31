terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region  = "eu-west-1"
  profile = "private"

  default_tags {
    tags = {
      Environment = "Test"
      Owner       = "V.Pakhai"
      Task        = "NeboTask"
      Topic       = "Custom-Metric-Logging"
    }
  }
}
