provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_instance" "terraform_arhel" {
  count				= 1
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= [aws_security_group.my_webserver.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Built by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF


  tags = {
    Name = "aws-tf-arhel"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "my_webserver_allow_tls"
  }
}
