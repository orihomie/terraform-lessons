provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_instance" "terraform_ubuntu" {
  count 	= 1
  ami		= "ami-08ca3fed11864d6bb"
  instance_type = "t3.micro"

  tags = {
    Name = "aws-tf-ubuntu"
  }
}


resource "aws_instance" "terraform_arhel" {
  count		= 1
  ami		= "ami-0bf84c42e04519c85"
  instance_type = "t3.small"

  tags = {
    Name = "aws-tf-arhel"
  }
}
