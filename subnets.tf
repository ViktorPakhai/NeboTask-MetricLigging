resource "aws_subnet" "public-eu-west-1a" { # Creating Public Subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.101.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-west-1a"
  }
}

resource "aws_subnet" "public-eu-west-1b" { # Creating Public Subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.102.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-west-1b"
  }
}

