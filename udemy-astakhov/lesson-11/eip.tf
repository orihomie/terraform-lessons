
resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_server.id
  
  tags = merge(var.default_tag, {
      Name = "${var.default_tag.Environment} Server Built by Terraform"
    })
}
