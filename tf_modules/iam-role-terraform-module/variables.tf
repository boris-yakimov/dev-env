variable "enabled" {
  type        = bool
  default     = false
  description = "Enable or Disable the module."
}

variable "role_name" {
  type        = string
  description = "Name of the role"
}

variable "iam_policies" {
  type = map(object({
    name   = string
    policy = string
  }))
}

variable "principals" {
  type = map(any)
}