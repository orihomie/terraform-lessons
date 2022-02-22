In this lection I've learned how to get and then substitute value of ami id variable.<br>:

- first you need to open amazon catalog and copy ami_id you're looking for
- then you need to go to AMI's tab, then choose "public amis" and paste copied ami_id
- you should see only one ami there, you'll need to copy its name and its 'owner' value, remember to wildcatd ami name because it would change in the future
- then use data source "aws_ami" to find current latest ami version for your region
- voila! you can now use it to create resource with latest version of needed ami
in any region
