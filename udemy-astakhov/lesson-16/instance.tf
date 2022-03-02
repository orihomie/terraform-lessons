
resource "aws_instance" "servers" {
	count			= 3
	ami 			= data.aws_ami.latest_amazon.id
	instance_type		= "t3.micro" #lookup(var.ec2_size, var.env)

	tags = {
		Name = "Server #${count.index} Built by Terraform"
	}		
}

output "server_all" {
	value = aws_instance.servers
}

output "server_all_custom" {
	value = {
		for server in aws_instance.servers:
			server.id => server.public_ip
	}
}
