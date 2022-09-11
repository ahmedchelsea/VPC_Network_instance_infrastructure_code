output "jenkins_ip_address" {
  value = "${aws_instance.ahmed-instance-ec2.public_ip}"
}