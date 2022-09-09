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
resource "aws_route_table" "public-route-table" {
    vpc_id = "${aws_vpc.ahmed.id}"
    tags = {
    Name = "${var.environment}-public-route-table"
   }   
}
resource "aws_route_table_association" "public-route-association-1" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_public_subnet-1.id}"
}
resource "aws_route_table_association" "public-route-association-2" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_public_subnet-2.id}"
}
resource "aws_route_table_association" "public-route-association-3" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_public_subnet-3.id}"
}
resource "aws_subnet" "ahmed_private_subnet-1" {
  cidr_block        = "${var.ahmed_private_subnet-1}"
  vpc_id            = "${aws_vpc.ahmed.id}"
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.environment}-Private-Subnet-1"
  }
}
resource "aws_subnet" "ahmed_private_subnet-2" {
  cidr_block        = "${var.ahmed_private_subnet-2}"
  vpc_id            = "${aws_vpc.ahmed.id}"
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.environment}-Private-Subnet-2"
  }
}
resource "aws_subnet" "ahmed_private_subnet-3" {
  cidr_block        = "${var.ahmed_private_subnet-3}"
  vpc_id            = "${aws_vpc.ahmed.id}"
  availability_zone = "${var.region}c"
  tags = {
    Name = "${var.environment}-Private-Subnet-3"
  }
}
resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.ahmed.id}"
  tags = {
    Name = "${var.environment}-private-route-table"
  }
}
resource "aws_route_table_association" "private-route-association-1" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_private_subnet-1.id}"
}
resource "aws_route_table_association" "private-route-association-2" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_private_subnet-2.id}"
}
resource "aws_route_table_association" "private-route-association-3" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  subnet_id      = "${aws_subnet.ahmed_private_subnet-3.id}"
}
resource "aws_eip" "elastic-ip-for-nat-gw" {
  vpc                       = true
  associate_with_private_ip = "10.0.0.5"
  tags = {
    Name = "${var.environment}-EIP"
  }
}
resource "aws_nat_gateway" "ahmed_nat-gw" {
  allocation_id = "${aws_eip.elastic-ip-for-ahmed_nat-gw.id}"
  subnet_id     = "${aws_subnet.ahmed_public_subnet-1.id}"
  tags = {
    Name = "${var.environment}-NATGW"
  }
  depends_on = [aws_eip.elastic-ip-for-nat-gw]
}
resource "aws_route" "nat-gw-route" {
  route_table_id         = "${aws_route_table.private-route-table.id}"
  nat_gateway_id         = "${aws_nat_gateway.ahmed_nat-gw.id}"
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_internet_gateway" "ahmed-igw" {
  vpc_id = "${aws_vpc.ahmed.id}"
  tags = {
    Name = "${var.environment}-IGW"
  }
}
resource "aws_route" "public-internet-igw-route" {
  route_table_id         = "${aws_route_table.public-route-table.id}"
  gateway_id             = "${aws_internet_gateway.ahmed-igw.id}"
  destination_cidr_block = "0.0.0.0/0"
}
