variable "permissions_policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "policy" {
  description = "IAM policy"
}

variable "description" {
  default = "permission policy"
}