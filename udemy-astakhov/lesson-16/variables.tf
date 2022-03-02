variable "region" {
	default = "eu-west-1"
}

variable "aws_users" {
	default = ["donald", "vasya", "petya", "kolya", "lena", "masha", "misha"]
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

variable "prod_admin" {
	default = "Orkhan Mamedov"
}

variable "stage_admin" {
	default = "Mamed Orkhanov"
}

variable "instance_type" {
	default = "t3.micro"
}

variable "allowed_ports_list" {
	default = {
		"prod" = ["80", "443"]
		"stage" = ["80", "443", "8080", "22"]
		"dev" = ["80", "443", "8080", "22"]
	}
}

