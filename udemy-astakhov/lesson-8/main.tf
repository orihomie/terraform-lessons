provider "aws" {
	region 	= "${var.region}"
}


data "aws_availability_zones" 	"working" {
	all_availability_zones = true
	state = "available"
}

data "aws_caller_identity"	"current" {}
data "aws_region"		"current" {}
data "aws_vpcs"			"my_vpcs" {}
data "aws_vpc"			"current" {}


resource "aws_subnet" "my_subnet_1" {
	vpc_id = data.aws_vpc.current.id
	availability_zone = data.aws_availability_zones.working.names[0]
	cidr_block = "172.31.101.0/24"
	tags = {
		Name = "subnet-1 in ${data.aws_availability_zones.working.names[0]}"
		Account = "subnet in account ${data.aws_caller_identity.current.account_id}"
		Region = data.aws_region.current.description
	}
}

resource "aws_subnet" "my_subnet_2" {
	vpc_id = data.aws_vpc.current.id
	availability_zone = data.aws_availability_zones.working.names[1]
	cidr_block = "172.31.102.0/24"
	tags = {
		Name = "subnet-2 in ${data.aws_availability_zones.working.names[1]}"
		Account = "subnet in account ${data.aws_caller_identity.current.account_id}"
		Region = data.aws_region.current.description
	}
}
output "data_aws_vpc_cidr" {
        value = data.aws_vpc.current.cidr_block
}

output "data_aws_vpc_id" {
	value = data.aws_vpc.current.id
}


output "data_aws_vpcs" { 
	value = data.aws_vpcs.my_vpcs.ids
}


output "data_aws_availability_zones" {
	value = data.aws_availability_zones.working.names
}

output "data_aws_caller_identity" {
	value = data.aws_caller_identity.current.account_id
}

output "data_aws_region_name" {
	value = data.aws_region.current.name
}

output "data_aws_region_description" {
	value = data.aws_region.current.description
}
