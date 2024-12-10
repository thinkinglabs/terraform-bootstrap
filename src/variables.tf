variable "region" {
  description = "The AWS region used"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "an-app"
}

variable "stack_name" {
  description = "Application stack name"
  type        = string
  default     = "a-stack"
}

variable "role_arn" {
  description = "The environment provisioner role ARN"
  type        = string
}
