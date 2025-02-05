# IAM Role that can be assumed by Terraform for cross account accesss 
resource "aws_iam_role" "default" {
  count = var.enabled ? 1 : 0
  name  = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        # Account from where this role will be assumed
        Principal = var.principals
      },
    ]
  })

  managed_policy_arns = [for policy in aws_iam_policy.default : policy.arn]

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_policy" "default" {
  for_each = var.enabled ? var.iam_policies : {}

  name   = each.value.name
  policy = each.value.policy
}
