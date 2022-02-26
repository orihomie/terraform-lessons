provider "aws" {
	profile	= "${var.profile}"
	region = "${var.region}"
}

resource "null_resource" "command1" {
	provisioner "local-exec" {
		command = "echo Terraform Start: $(date) >> log.txt"
	}
}

resource "null_resource" "command2" {
	provisioner "local-exec" {
		command = "ping -c 5 google.com"
	}
	depends_on = [null_resource.command1]
}

resource "null_resource" "command3" {
	provisioner "local-exec" {
		command = "print('Hello, world!')"
		interpreter = ["python3", "-c"]
	}
	depends_on = [null_resource.command1]
}

resource "null_resource" "command4" {
	provisioner "local-exec" {
		command = "echo $NAME1 $NAME2"
		environment = {
			NAME1 = "Vasya"
			NAME2 = "Petya"
		}
	}
	depends_on = [null_resource.command1]
}


resource "null_resource" "command5" {
        provisioner "local-exec" {
                command = "echo Terraform End: $(date) >> log.txt"
        }
	depends_on = [null_resource.command4]
}
