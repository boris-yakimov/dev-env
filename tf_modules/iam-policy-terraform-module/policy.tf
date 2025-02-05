resource "aws_iam_policy" "policy" {
  name        = var.permissions_policy_name
  description = var.description
  policy      = var.policy
}