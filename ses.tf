
# Domain verificaion for sender
resource "aws_ses_domain_identity" "sender" {
  domain = "${var.domain}"
}

resource "aws_ses_domain_dkim" "sender" {
  domain = "${var.domain}"
}



# Email recieving for recipient
# Optional
resource "aws_ses_receipt_rule" "recipient" {
  name          = "${var.system}-incoming"
  rule_set_name = "${aws_ses_receipt_rule_set.recipient.rule_set_name}"
  recipients    = ["test@${var.domain}"]
  enabled       = true
  scan_enabled  = true

  s3_action {
    bucket_name = "${aws_s3_bucket.email_bucket.id}"
    position    = 1
  }
}

resource "aws_ses_receipt_rule_set" "recipient" {
  rule_set_name = "${var.system}-rules"
}

resource "aws_ses_active_receipt_rule_set" "recipient" {
  rule_set_name = "${aws_ses_receipt_rule_set.recipient.rule_set_name}"
}