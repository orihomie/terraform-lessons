
output "webserver_instance_id" {
  value = aws_instance.terraform_arhel.id
}


output "webserver_instance_ip" {
  value = aws_eip.my_static_ip.public_ip
}
