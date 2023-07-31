# Create the VPC
resource "aws_vpc" "main" { # Creating VPC here
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

