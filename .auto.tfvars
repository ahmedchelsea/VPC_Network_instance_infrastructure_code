vpc_cidr = "10.0.0.0/16"
ahmed_vpc_public_subnet-1 = "10.0.1.0/24"
ahmed_vpc_public_subnet-2 = "10.0.2.0/24"
ahmed_vpc_public_subnet-3 = "10.0.3.0/24"
region = "us-east-1"
environment = "ahmed"
ahmed_private_subnet-1 = "10.0.10.0/24"
ahmed_private_subnet-2 = "10.0.11.0/24"
ahmed_private_subnet-3 = "10.0.12.0/24"
instance_type = "t2.micro"
instance_ami = 
keyname =
 # "${}" calls variables ("${var.region}") and attributes of resources ("${aws_vpc.ahmed}"")