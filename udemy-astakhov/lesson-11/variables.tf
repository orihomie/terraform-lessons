variable "region" {
	default = "eu-west-1"
}

variable "profile" {
	default = "default"
}

variable "instance_type" {
	default = "t3.micro"
}

variable "allowed_ports" {
	type = list
	default = ["80", "443", "22"]
}

variable "detailed_monitoring" {
	type = bool
	default = false 
}

variable "default_tag" {
	description = "Common tags for all resources"
	type = map
	default = {
		Owner = "Orkhan Mamedov"
		CostCenter = "MyBudget"
		Environment = "Udemy"
	}
}
