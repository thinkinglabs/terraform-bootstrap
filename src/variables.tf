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

variable "component_name" {
  description = "Component name within the application/service"
  type        = string
  default     = "a-component"
}

variable "role_arn" {
  description = "The environment provisioner role ARN"
  type        = string
}
