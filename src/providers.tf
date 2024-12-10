provider "aws" {

  region = var.region

  assume_role {
    role_arn = var.role_arn
  }

  default_tags {    
    tags = {
      Application = var.app_name
      Component   = var.stack_name 
      Environment = var.environment
    }
  }
}
