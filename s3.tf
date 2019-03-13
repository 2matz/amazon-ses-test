# Email recieving for recipient
# Optional
resource "aws_s3_bucket" "email_bucket" {
  bucket = "${var.system}"
  acl    = "private"
  policy = "${data.aws_iam_policy_document.email_bucket.json}"

  tags = {
    Name  = "${var.system}"
  }
}

data "aws_iam_policy_document" "email_bucket" {
  statement {
    sid    = "ses"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ses.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.system}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:Referer"

      values = [
        "${data.aws_caller_identity.main.account_id}",
      ]
    }
  }
}