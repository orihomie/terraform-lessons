In this lesson I've learned how to make a variables of different types.<br>
There are only 3 types of variables:
- string
- number
- bool
- map

After defining variables one can access them by var._variable_name_.<br>

To merge variables of type `map` one need to use function `merge`. Also, map properties can be accessed this way:<br>
```terraform
variable somemapvar {
  default = {
    Property = "Foo"
  }
}
```

`var.somemapvar.Property`

### Overriding variables by CLI

tf plan -var="instance_type=t3.small" -var="region=eu-central-1"

### Overriding variables by ENV

Terraform checks for environment variables with prefix `TF_VAR_` on executing any command and substitutes them if there's something to substitute.<br>

export TF_VAR_region=us-west-2<br>
or<br>
TF_VAR_region=us-west-2 tf plan<br>


### Most common option `terraform.tfvars`

A file with needed default values, looks like .env file.<br>
Could be names as `terraform.tfvars` or `*.auto.tfvars` (`prod.auto.tfvars`). In this case you'll need to<br>
pass needed file name as `-var-file="prof.auto.tfvars"`.


## Env priority

- env vars
- terraform.tfvars file
- terraform.tfvars.json
- *.auto.tfvars or *auto.tfvars.json
- -var or -var-file option
