#!/bin/bash
yum -y update
yum -y install httpd

myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > var/www/html/index.html
<html>
<h2>WebServer with IP: $myip</h2>
<br>Built by Terraform!<font color="red">ver. 0.12</font></h2><br>
Owner ${f_name} ${l_name}<br>

%{ for x in names ~}
Hello to ${x} from ${f_name}<br>
%{ endfor ~}


</html>
EOF


sudo service httpd start
chkconfig httpd on

