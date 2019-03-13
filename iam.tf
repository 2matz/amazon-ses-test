# SMTP credential fot email sending

resource "aws_iam_access_key" "sender" {
  user    = "${aws_iam_user.sender.name}"
#   user    = "${var.iam_user}"
}

resource "aws_iam_user" "sender" {
  name = "${var.iam_user}"
}

data "aws_iam_policy_document" "sender" {
  statement {
    sid = "ses"

    actions = [
      "ses:SendRawEmail",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "sender" {
  name        = "${var.system}"
  description = "A test policy"
  policy      = "${data.aws_iam_policy_document.sender.json}"
}

resource "aws_iam_user_policy_attachment" "sender" {
  user       = "${aws_iam_user.sender.name}"
  policy_arn = "${aws_iam_policy.sender.arn}"
}