
resource "aws_iam_user" "user1" {
	name = "Pushkin"
}

resource "aws_iam_user" "users" {
	count = length(var.aws_users)
	name = element(var.aws_users, count.index)
}

output "created_iam_users_all" {
	value = aws_iam_user.users
}

output "created_iam_users_ids" {
	value = aws_iam_user.users[*].id
}

output "created_iam_users_custom" {
	value = [
		for user in aws_iam_user.users:
			"Username: ${user.name} has arn: ${user.arn}"
	]
}

output "created_iam_users_map" {
	value = {
		for user in aws_iam_user.users:
			user.unique_id => user.id
	}
}

output "created_if_length" {
	value = [
		for user in aws_iam_user.users:
			user.name
			if length(user.name) == 4
	
	]
}
