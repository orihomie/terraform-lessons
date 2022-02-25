region 			= "ca-central-1"
instance_type		= "t3.small"
detailed_monitoring	= true

allowed_ports		= [ "80", "443" ]

default_tag = {
  Owner		= "Orkhan Mamedov"
  CostCenter 	= "ProdBudget"
  Environment 	= "prod"
}
