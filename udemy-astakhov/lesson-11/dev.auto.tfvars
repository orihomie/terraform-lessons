region 			= "ca-central-1"
instance_type		= "t3.micro"
detailed_monitoring	= false

allowed_ports		= [ "80", "22", "8080" ]

default_tag = {
  Owner		= "Orkhan Mamedov"
  CostCenter 	= "DevBudget"
  Environment 	= "dev"
}
