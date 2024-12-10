variable "region" {
  description = "The AWS region used"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "env_role_arn" {
  description = "The environment provisioner role ARN"
  type        = string
}
