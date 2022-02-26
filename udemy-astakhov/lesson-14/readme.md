In this lesson I've learned:<br>
- how to generate passwords `resource "random_string"`
- how to keep passwords in aws as `aws_ssm_parameter`
- how to set this parameter as a password of instance to be created
- how to make anchor variables, which when to be changed, would trigger creating new password and setting new password to a dependant instance

