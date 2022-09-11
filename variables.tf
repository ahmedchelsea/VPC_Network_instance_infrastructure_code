variable "vpc_cidr" {
    description = "VPC cidr block"
}
variable "ahmed_vpc_public_subnet-1" {
  description = "Public Subnet 1 cidr block"
}
variable "ahmed_vpc_public_subnet-2" {
  description = "Public Subnet 2 cidr block"
}
variable "ahmed_vpc_public_subnet-3" {
    description = "Public Subnet 3 cidr block"
}
variable "region" {
    description = "us east 1"
}
variable "environment" {
  default = "ahmed"
}
variable "ahmed_private_subnet-1" {
description = "Private subnet 1 cidr block"
}
variable "ahmed_private_subnet-2" {
  description = "Private subnet 2 cidr block"
}
variable "ahmed_private_subnet-3" {
  description = "Private subnet 3 cidr block"
}
variable  "instance_type"{
  description = "t2.micro"
}
variable "instance_ami" {
description = "amazon machine image"
}
variable "keyname" {
  description = "ahmed1"
}