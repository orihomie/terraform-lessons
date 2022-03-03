provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}

provider "aws" {
	region = "us-east-1"
	alias = "USA" 
}

provider "aws" {
	region = "ca-central-1"
	alias = "CAN"
}

data "aws_availability_zones" "available" {}

data "aws_ami" "latest_amazon" {
	provider = aws.USA
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

