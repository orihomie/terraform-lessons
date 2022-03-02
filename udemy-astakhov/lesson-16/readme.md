In this lection I've learned that:
- the `count` variable has property `index` and it seems that a `count` itself is an `enumerator`
- there's the `element(list, index)` function
- there's also `for` function
	- creates lists
```
value = [ for item in aws_instance.servers:
		item.id ]
```
	- creates maps
```
value = { for item in aws_instance.servers:
		item.id => item.public_ip }
```
- there's `*` for indexer: `value = aws_instance.servers[*].id`
