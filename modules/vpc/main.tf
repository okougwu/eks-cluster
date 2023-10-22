resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "private_subnet_a" {
  count = 2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-west-2a"  # Adjust for your desired AZs

  tags = {
    Name = "PrivateSubnetA-${count.index}"
  }
}

resource "aws_subnet" "public_subnet_a" {
  count = 2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index + 2}.0/24"
  availability_zone = "us-west-2a"  # Adjust for your desired AZs

  tags = {
    Name = "PublicSubnetA-${count.index}"
  }
}
