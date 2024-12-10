provider "aws" {

  region = var.region

  assume_role {
    role_arn = var.env_role_arn
  }

  default_tags {    
    tags = {
      Application = var.app_name
      Component   = var.component_name 
      Environment = var.environment
    }
  }
}
