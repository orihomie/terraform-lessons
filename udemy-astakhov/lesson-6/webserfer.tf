provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.terraform_arhel.id
}

resource "aws_instance" "terraform_arhel" {
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= ["sg-d92b65bc"]
  user_data 			= templatefile("./user-data.sh.tpl", {
	f_name = "Orkhan",
	l_name = "Mamedov",
	names = ["vasya", "petya"]
    })

  tags = {
    Name = "aws-tf-arhel"
  }

  lifecycle {
    create_before_destroy = true
  }
}

