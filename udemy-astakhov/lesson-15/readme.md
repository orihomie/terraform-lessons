In this lection I've learned how works the ternary operator:

> something = var.myvar == "someval" ? var.env.prod : var.env.dev

Or how to conditionally create a resource:

```
resource "aws_instance" "my_dev_instance" {
	...
	count	= var.env == "dev" ? 1 : 0
}

## lookup(map, key)

Also I've learned how to avoid conditionig by using `lookup` method:

```
instance_type = lookup(var.my_map_variable, var.env)
```

