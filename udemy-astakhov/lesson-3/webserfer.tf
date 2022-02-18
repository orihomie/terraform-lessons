provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_instance" "terraform_arhel" {
  count				= 1
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= ["sg-d92b65bc"]
  user_data 			= file("./user-data.sh")

  tags = {
    Name = "aws-tf-arhel"
  }
}
