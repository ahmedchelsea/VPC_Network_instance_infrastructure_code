variable "vpc_cidr" {
    description = "VPC cidr block"
}
variable "ahmed_vpc_public_subnet-1" {
  description = "Public Subnet 1 cidr block"
}
variable "ahmed_vpc_public_subnet-2" {
  description = "Public Subnet 2 cidr block"
}
variable "region" {
    description = "us east 1"
}
variable "environment" {
  default = "Development"
}
