
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2 -y
cat /etc/system-release -y
sudo yum install -y httpd mariadb-server 
sudo systemctl start httpd -y
sudo systemctl enable httpd -y
sudo systemctl is-enabled httpd -y
