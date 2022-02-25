In this lesson I've learned how to make a variables of different types.<br>
There are only 3 types of variables:
- string
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
