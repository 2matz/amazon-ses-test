# resource "aws_ses_domain_identity" "ses" {
#   domain = "${var.domain}"
# }

# resource "aws_ses_domain_dkim" "dkim" {
#   domain = "${var.domain}"
# }

# resource "aws_ses_receipt_rule" "incoming" {
#   name          = "${var.system}-incoming"
#   rule_set_name = "${aws_ses_receipt_rule_set.incoming.rule_set_name}"
#   recipients    = ["test@${var.domain}"]
#   enabled       = true
#   scan_enabled  = true

#   s3_action {
#     bucket_name = "${aws_s3_bucket.email_bucket.id}"
#     position    = 1
#   }
# }

# resource "aws_ses_receipt_rule_set" "incoming" {
#   rule_set_name = "${var.system}-rules"
# }

# resource "aws_ses_active_receipt_rule_set" "incoming" {
#   rule_set_name = "${aws_ses_receipt_rule_set.incoming.rule_set_name}"
# }