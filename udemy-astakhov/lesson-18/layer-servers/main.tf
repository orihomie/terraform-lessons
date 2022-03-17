provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}


terraform {
	backend "s3" {
		bucket = "orkhan-mamedovs-terraform-state"
		key = "dev/servers/terraform.tfstate"
		region = "eu-west-1"
	}
}

data "terraform_remote_state" "network" {
	backend = "s3"
	config = {
		bucket = "orkhan-mamedovs-terraform-state"
		key = "dev/network/terraform.tfstate"
		region = "eu-west-1"
	}
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

resource "aws_instance" "web_server" {
	ami = data.aws_ami.latest_amazon.id
	instance_type = "t3.micro"
	vpc_security_group_ids = [aws_security_group.webserver.id]
	subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
	user_data = file("./user-data.sh")

	tags = {
		Name = "Web Server"
		Owner = "Orkhan Mamedov"
	}
}

resource "aws_security_group" "webserver" {
	name = "WebServer Security Group"
	vpc_id = data.terraform_remote_state.network.outputs.vpc_id

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "web-server-sg"
		Owner = "Orkhan Mamedov"
	}
}

output "web_server_public_ip" {
	value = aws_instance.web_server.public_ip
}

output "security_group_id" {
	value = aws_security_group.webserver.id
}
