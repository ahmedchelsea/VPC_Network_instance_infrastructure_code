resource "aws_vpc" "ahmed_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ahmed_vpc"
  }
}
resource "aws_subnet" "ahmed_vpc_public_subnet1" {
  vpc_id     = aws_vpc.ahmed_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  

  tags = {
    Name = "ahmed_vpc"
  }
}

    resource "aws_subnet" "ahmed_vpc_public_subnet2" {
  vpc_id     = aws_vpc.ahmed_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  
  
  tags = {
    Name = "ahmed_vpc"
  }
}