provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}

data "aws_availability_zones" "available" {}

data "aws_ami" "latest_amazon" {
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

output "web_loadbalancer_url" {
	value = aws_elb.web.dns_name
}
