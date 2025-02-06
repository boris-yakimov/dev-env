provider "aws" {
  region = "us-east-1"
}

# Create IAM Role
resource "aws_iam_role" "example_role" {
  name = "example_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach IAM Policy
resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "Policy to allow SQS, SNS, and S3 access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sqs:*",
        "sns:*",
        "s3:*",
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.example_role.name
  policy_arn = aws_iam_policy.example_policy.arn
}

# Create SNS Topic
resource "aws_sns_topic" "example_topic" {
  name = "example-topic"
}

# Create SQS Queue
resource "aws_sqs_queue" "example_queue" {
  name = "example-queue"
}

# Allow SNS to send messages to SQS
resource "aws_sqs_queue_policy" "example_queue_policy" {
  queue_url = aws_sqs_queue.example_queue.url

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.example_queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.example_topic.arn}"
        }
      }
    }
  ]
}
EOF
}

# Subscribe SQS to SNS
resource "aws_sns_topic_subscription" "example_subscription" {
  topic_arn = aws_sns_topic.example_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.example_queue.arn
}

# Create S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
}

# Create KMS Key
resource "aws_kms_key" "example_kms" {
  description = "KMS key for S3 encryption"
  deletion_window_in_days = 30
}

# Grant IAM Role permission to KMS Key
resource "aws_kms_key_policy" "example_kms_policy" {
  key_id = aws_kms_key.example_kms.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_role.example_role.arn}"
      },
      "Action": [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Configure S3 Event Notification to SNS
resource "aws_s3_bucket_notification" "example_notification" {
  bucket = aws_s3_bucket.example_bucket.id

  topic {
    topic_arn = aws_sns_topic.example_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
