provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}

provider "aws" {
	region = "us-east-1"
	alias = "dev"

	assume_role {
		role_arn = "arn:aws:iam::466587349942:role/TerraformRole"
	}	
}

provider "aws" {
	region = "ca-central-1"
	alias = "prod"
	
	assume_role {
		role_arn = "arn:aws:iam::466587349942:role/TerraformRole"
	}
}

data "aws_availability_zones" "available" {}

module "servers" {
	source 	= "./module-servers"
	env 	= var.env
	ec2_size = var.ec2_size
	providers = {
		aws 		= aws
		aws.prod 	= aws.prod
		aws.dev 	= aws.dev
	}
}
