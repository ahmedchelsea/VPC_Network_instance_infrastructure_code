resource "aws_vpc" "ahmed" {
  cidr_block       = "${var.vpc_cidr}"

  instance_tenancy = "default"

  tags = {
    Name = "${var.environment}-VPC"
  }
}
resource "aws_subnet" "ahmed_public_subnet-1" {
  vpc_id     = "${aws_vpc.ahmed.id}"
  cidr_block = "${var.ahmed_vpc_public_subnet-1}"
  availability_zone = "${var.region}a"
  

  tags = {
    Name = "${var.environment}-public_subnet-1"
  }
}
resource "aws_subnet" "ahmed_public_subnet-2" {
  vpc_id     = "${aws_vpc.ahmed.id}"
  cidr_block = "${var.ahmed_vpc_public_subnet-2}"
  availability_zone = "${var.region}b"
 
  tags = {
    Name = "${var.environment}-public_subnet-2"
  }
}
resource "aws_subnet" "ahmed_public_subnet-3" {
  vpc_id     = "${aws_vpc.ahmed.id}"
  cidr_block = "${var.ahmed_vpc_public_subnet-3}"
  availability_zone = "${var.region}c"
  tags = {
    Name = "${var.environment}-public_subnet-3"
  }
}
resource "aws_route" "public_route" {
    vpc_id = "${aws_vpc.ahmed.id}"
    tags = {
    Name = "${var.environment}-public-route-table"
   }   
}

