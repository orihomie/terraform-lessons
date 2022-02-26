

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

locals {
  full_project_name = "${var.environment} of ${var.owner}"
  project_owner = "${var.owner} owner of %this_project%"
  az_list = join(", ", data.aws_availability_zones.available.names)
  region = data.aws_region.current.name
  location = "Region ${local.region} has following availability zones: ${local.az_list}"
}

resource "aws_eip" "my_static_ip" {
  tags = {
    Name = "Static IP"
    Owner = local.project_owner
    Project = local.full_project_name
    Location = local.location
  }
}
