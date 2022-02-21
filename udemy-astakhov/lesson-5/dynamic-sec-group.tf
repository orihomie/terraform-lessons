provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_security_group" "my_webserverl" {
	name			= "WebServer Security Group"
	description		= "Security Group made by Terraform"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	
	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "aws-tf-secgroup"
	}
}
