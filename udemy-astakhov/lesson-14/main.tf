provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}

variable "name" {
	default = "Vasya"
}

resource "random_string" "rds_password" {
	length = 12
	special = true
	override_special = "!#$&"
	keepers = {
		name = var.name
	}
}

resource "aws_ssm_parameter" "rd_password" {
	name 		= "/prod/mysql"
	description 	= "Master password for rds mysql"
	type 		= "SecureString"
	value 		= random_string.rds_password.result
}

data "aws_ssm_parameter" "my_rds_password" {
	name = "/prod/mysql"

	depends_on = [aws_ssm_parameter.rd_password]
}

resource "aws_db_instance" "default" {
  identifier		= "prod-rds"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name                 = "prod"
  username             = "admin"
  password             = data.aws_ssm_parameter.my_rds_password.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  apply_immediately	= true
}

output "rds_password" {
	value = data.aws_ssm_parameter.my_rds_password.value
	sensitive = true
}
