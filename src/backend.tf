
terraform {
  backend "s3" {
    region     = "eu-west-1"
    bucket     = "<provisioner-state-bucket-name>"
    key        = "<app-name>/<component-name>/terraform.tfstate"
    acl        = "bucket-owner-full-control"
    workspace_key_prefix = "env:"
    encrypt    = true
    kms_key_id = "<provisioner-kms-key-arn>"
  }
}
