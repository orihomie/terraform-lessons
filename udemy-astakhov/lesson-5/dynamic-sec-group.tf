provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_security_group" "my_webserverl" {
	name			= "Dynamic Security Group"
	description		= "Security Group made by Terraform"

	dynamic "ingress" {
		for_each = ["80", "443", "8080", "1541"]
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
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
