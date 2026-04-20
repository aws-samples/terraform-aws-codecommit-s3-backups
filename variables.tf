// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "name" {
  type = string
}

variable "s3_logging_bucket" {
  type        = string
  description = "S3 access logging bucket id"
  default     = null
}

variable "kms_key" {
  type        = string
  description = "AWS KMS key arn"
  default     = null
}
