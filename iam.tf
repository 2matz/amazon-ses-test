# resource "aws_iam_access_key" "test" {
# #   user    = "${aws_iam_user.test.name}"
#   user    = "${var.iam_user}"
# }

# resource "aws_iam_user" "test" {
#   name = "${var.iam_user}"
# }