output "smtp_endpoint" {
  value = "email-smtp.${data.aws_region.main.name}.amazonaws.com:465" // TLS wrapper endpoint
}

output "smtp_key" {
  value = "${aws_iam_access_key.sender.id}"
}
output "smtp_password" {
  value = "${aws_iam_access_key.sender.ses_smtp_password}"
}