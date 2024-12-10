# terraform-bootstrap

A bootstrap project to kickstart a Terraform component.

## Setup

Install [Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform).

Install [tflint](https://github.com/terraform-linters/tflint).

Install [Trivy](https://trivy.dev/latest/getting-started/)

## Apply

To apply a configuration:

```bash
make plan env=<env>
make apply
```

where `<env>` is one of `development`, `test` or `production`.
