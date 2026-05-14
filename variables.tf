// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "access_logging_bucket" {
  description = "s3 server access logging bucket arn"
  type        = string
  default     = null
}

variable "kms_key" {
  description = "ARN of an existing KMS key to encrypt the S3 bucket and CloudWatch log group"
  type        = string
  default     = null
}

variable "name" {
  description = "Name used for resource naming (CodeBuild project, IAM roles, S3 bucket)"
  type        = string
}
