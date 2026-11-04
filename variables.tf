// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "access_logging_bucket" {
  description = "s3 server access logging bucket arn"
  type        = string
  default     = null
}

variable "compute_type" {
  description = "CodeBuild compute type"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  description = "CodeBuild image (must include git, zip, python/pip and the AWS CLI)"
  type        = string
  default     = "aws/codebuild/standard:7.0"
}

variable "kms_key" {
  description = "ARN of an existing KMS key to encrypt the S3 bucket and CloudWatch log group"
  type        = string
  default     = null
}

variable "log_retention" {
  description = "CloudWatch log group retention, in days"
  type        = number
  default     = 30
}

variable "name" {
  description = "Name used for resource naming (CodeBuild project, IAM roles, S3 bucket)"
  type        = string
}
