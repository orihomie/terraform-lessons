
resource "aws_instance" "my_server" {
	ami 			= data.aws_ami.latest_amazon.id
	instance_type		= lookup(var.ec2_size, var.env)

	tags = {
		Name = "Server Built by Terraform"
	}		
}

