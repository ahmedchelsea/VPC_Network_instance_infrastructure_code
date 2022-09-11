data "aws_ami" "amazon-Linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
    filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
 }
}
resource "aws_instance" "ahmed-instance-ec2" {
  ami             = "${data.aws_ami.amazon-Linux-2.id}"
  instance_type   = "t2.micro"
  key_name        = "${var.keyname}"
  #vpc_id          = "${aws_vpc.ahmed.id}"
  vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_ahmed-instance-ec2.id}"]
  subnet_id          = "${aws_subnet.ahmed_public_subnet-1.id}"
  #name            = "${var.name}"
  user_data = "${file("Data_install_ahmed-instance-ec2.sh")}"

  associate_public_ip_address = true
  tags = {
    Name = "ahmed-instance-ec2"
  }
}
resource "aws_security_group" "sg_ahmed" {
  name        = "ssh-ahmed-instance-ec2"
  description = "Allow SSH and ahmed-instane-ec2 inbound traffic"
  vpc_id      = "${aws_vpc.ahmed.id}"
}
ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
