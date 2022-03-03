variable "region" {
	default = "eu-west-1"
}

variable "provider_alias" {
	default = "USA"
}


variable "ec2_size" {
	default = {
		"prod" 		= "t3.large"
		"stage" 	= "t3.medium"
		"dev"		= "t3.micro"
	}
}

variable "profile" {
	default = "default"
}

variable "env" {
	default = "dev"
}

variable "instance_type" {
	default = "t3.micro"
}

