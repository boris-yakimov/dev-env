resource "aws_sns_topic" "cloudwatch_alarms" {
  name              = var.sns_topic_name
  display_name      = var.display_name_enabled ? var.sns_display_name : null
  kms_master_key_id = var.kms_master_key_id_enabled ? var.sns_master_key_id : null
  delivery_policy   = var.delivery_policy
  policy            = var.sns_policy
  tags              = var.tags
}

resource "aws_sns_topic_subscription" "sns_subscribers" {
  depends_on = [aws_sns_topic.cloudwatch_alarms]
  for_each   = toset(var.sns_subscribers)
  topic_arn  = var.topic_arn
  protocol   = var.sns_protocol
  endpoint   = each.value

  lifecycle {
    ignore_changes = [
      confirmation_timeout_in_minutes,
      endpoint_auto_confirms
    ]
  }
}