
resource "aws_instance" "my_server" {
	ami 			= data.aws_ami.latest_amazon.id
	instance_type		= lookup(var.ec2_size, var.env)
	vpc_security_group_ids 	= [aws_security_group.web.id]
	monitoring 		= false

	tags = {
		Name = "${var.env}-server Built by Terraform"
		Owner = var.env == "prod" ? var.prod_admin : var.stage_admin
	}		
}

resource "aws_instance" "my_dev_bastion" {
	count 			= var.env == "dev" ? 1 : 0
	ami 			= data.aws_ami.latest_amazon.id
	instance_type		= "t3.micro" 
	vpc_security_group_ids 	= [aws_security_group.web.id]

	tags = {
		Name = "Bastion Server for dev"
	}		
}
