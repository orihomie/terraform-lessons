
resource "aws_autoscaling_group" "web" {
  name_prefix               = "ASG-${aws_launch_configuration.web.name}"
  max_size                  = 2
  min_size                  = 2
  min_elb_capacity	    = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers	    = [aws_elb.web.name]
  launch_configuration      = aws_launch_configuration.web.name
  vpc_zone_identifier       = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]

  dynamic "tag" {
    for_each = {
        Name = "WebServer in ASG"
        Owner = "Orkhan Mamedov" 
    }
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
