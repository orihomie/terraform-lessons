
resource "aws_instance" "my_server" {
	ami 			= data.aws_ami.latest_amazon.id
	instance_type		= "${var.instance_type}"
	vpc_security_group_ids 	= [aws_security_group.web.id]
	monitoring 		= var.detailed_monitoring

	tags = merge(var.default_tag, {
			Name = "${var.default_tag.Environment} Server Built by Terraform"
		})
}
