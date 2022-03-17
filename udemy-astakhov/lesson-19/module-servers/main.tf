
terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			configuration_aliases = [ aws, aws.prod, aws.dev ]
		}
	}
}

data "aws_ami" "latest_amazon_root" {
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

data "aws_ami" "latest_amazon_prod" {
	provider = aws.prod
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

data "aws_ami" "latest_amazon_dev" {
	provider = aws.dev
	owners = ["137112412989"]
	most_recent = true
	filter {
		name = "name"
		values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
	}
}

resource "aws_instance" "server_root" {
	ami 			= data.aws_ami.latest_amazon_root.id
	instance_type		= lookup(var.ec2_size, var.env)

	tags = {
		Name = "Root Server Built by Terraform"
	}		
}

resource "aws_instance" "server_prod" {
	provider 		= aws.prod
	ami 			= data.aws_ami.latest_amazon_prod.id
	instance_type		= lookup(var.ec2_size, var.env)

	tags = {
		Name = "Prod Server Built by Terraform"
	}		
}

resource "aws_instance" "server_dev" {
	provider 		= aws.dev
	ami 			= data.aws_ami.latest_amazon_dev.id
	instance_type		= lookup(var.ec2_size, var.env)

	tags = {
		Name = "Dev Server Built by Terraform"
	}		
}
