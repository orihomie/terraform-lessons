#!/bin/bash
yum -y update
yum -y install httpd

myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`


cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="black">
<h2><font color="gold">Built by Power of Terraform <font color="red">v1.1.6</font> with remote state</h2><br><p>

<font color="green">Server private IP: <font color="aqua">$myip<br><br>
<font color="magenta">
<b>Version 4.1</b>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on

