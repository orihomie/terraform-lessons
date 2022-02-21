provider "aws" {
  profile	= "${var.profile}"
  region 	= "${var.region}"
}

resource "aws_instance" "myserver_web" {
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= ["sg-d92b65bc"]

  tags = {
    Name = "server.web"
  }

  depends_on = [aws_instance.myserver_db]
}

resource "aws_instance" "myserver_app" {
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= ["sg-d92b65bc"]

  tags = {
    Name = "server.app"
  }

  depends_on = [aws_instance.myserver_db]
}

resource "aws_instance" "myserver_db" {
  ami				= "ami-0bf84c42e04519c85"
  instance_type 		= "t3.micro"
  vpc_security_group_ids 	= ["sg-d92b65bc"]

  tags = {
    Name = "server.db"
  }
}
