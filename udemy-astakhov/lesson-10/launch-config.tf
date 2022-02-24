resource "aws_launch_configuration" "web" {
	name_prefix	= "Highly-Available-WebServer-"
	image_id 	= data.aws_ami.latest_amazon.id
	instance_type	= "t3.micro"
	security_groups	= [aws_security_group.web.id]
	user_data 	= file("./user-data.sh")
	lifecycle {
    		create_before_destroy = true
  	}
}

