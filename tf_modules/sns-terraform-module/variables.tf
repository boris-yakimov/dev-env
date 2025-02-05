variable "sns_enable" {
  description = "Conditionally enables this module (and all it's ressources)."
  type        = bool
  default     = false
}

variable "topic_arn" {
  description = "The ARN of the SNS topic to subscribe to"
}

variable "sns_topic_name" {
  type = string
}
variable "sns_subscribers" {
  description = "Emails of notifications subscribers"
}

variable "delivery_policy" {
  description = "delivery_policy of sns topic"
}

variable "sns_policy" {
  default     = null
  description = "The fully-formed AWS policy as JSON"
}

variable "sns_protocol" {
  description = "channel to get notification from like email, sms"
}

variable "sns_display_name" {
  description = "Display name for sns topic"
}

variable "sns_master_key_id" {
  default     = null
  description = "Master key id for sns topic"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "display_name_enabled" {
  type        = bool
  description = "A boolean indicating whether AWS SNS display name will be set or not"
  default     = true
}

variable "kms_master_key_id_enabled" {
  type        = bool
  description = "A boolean indicating whether AWS SNS kms key id will be set or not"
  default     = false
}

variable "confirmation_timeout_in_minutes_enabled" {
  type        = bool
  description = "A boolean indicating whether AWS SNS kms key id will be set or not"
  default     = false
}