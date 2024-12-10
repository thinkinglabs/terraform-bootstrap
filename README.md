# terraform-bootstrap

A bootstrap project to kickstart a Terraform component.

## Setup

Install [Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Install [tflint](https://github.com/terraform-linters/tflint).

Install [Trivy](https://trivy.dev/latest/getting-started/)

## Public Cloud

AWS.

## Environments

Assumes three environments:

- `development`
- `test`
- `production`

Each environment has its own set of configurations `./environments/<env>.tfvar`.

Environments map to Terraform workspaces.

## Backend

The Terraform state is stored in an S3 bucket.

Either a single S3 bucket for all workspaces (environments).

Or one S3 bucket per environment.

## Apply

To apply a configuration:

```bash
make plan env=<env>
make apply
```

where `<env>` is one of `development`, `test` or `production`.
