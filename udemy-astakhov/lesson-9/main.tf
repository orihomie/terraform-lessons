provider "aws" {
	profile	= "${var.profile}"
	region 	= "${var.region}"
}

resource "aws_instance" "subst_ami_ubuntu" {
	ami		= data.aws_ami.latest_ubuntu.id
	instance_type	= "t3.micro"

	tags = {
		Name = "aws_tf_ubuntu"
	}
}

data "aws_ami" "latest_windows" {
	owners = ["801119661308"]
	most_recent = true
	filter {
		name = "name"
		values = ["Windows_Server-2019-English-Full-Base-*"]
	}
}

data "aws_ami" "latest_ubuntu" {
	owners = ["099720109477"]
	most_recent = true
	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
	}
}


data "aws_ami" "latest_amazon" {
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

output "latest_windows_ami_name" {
	value = data.aws_ami.latest_windows.name
}
output "latest_windows_ami_id" {
	value = data.aws_ami.latest_windows.id
}

output "latest_ubuntu_ami_name" {
	value = data.aws_ami.latest_ubuntu.name
}
output "latest_ubuntu_ami_id" {
	value = data.aws_ami.latest_ubuntu.id
}

output "latest_amazon_ami_name" {
	value = data.aws_ami.latest_amazon.name
}
output "latest_amazon_ami_id" {
	value = data.aws_ami.latest_amazon.id
}
