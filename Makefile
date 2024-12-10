SHELL := /bin/bash
.DEFAULT_GOAL := help
.PHONY: clean init check ws-select ws-list lint plan apply help

ifdef env
ifeq ($(shell echo $(env) | egrep "development|test|production"),)
$(error env should be one of development|test|production)
endif
endif

clean: ## Remove temporary files from local folders
	rm -rf ./src/.terraform ./src/tfplan ./src/tfplan.json

init: ## Terraform init
	$(info initialising ...)
	cd ./src && terraform init ${args} && tflint --init

check:
	if [[ -z "${env}" ]]; then echo "env must be set to development|staging|production";false; fi

ws-list: ## Lists Terraform workspaces
	cd ./src && terraform workspace list

ws-new: ## Creates a new Terraform workspace
	cd ./src && terraform workspace new $(env)
	mkdir -p environments
	touch environments/$(env).tfvar

ws-select: check ## Switches between Terraform workspaces
	$(info switching workspace to $(env) ...)
	cd ./src && terraform workspace select $(env)

lint: ## Static code analysis
	$(info validating ...)
	cd ./src && terraform validate
	cd ./src && tflint

scan: check ## Scans for misconfigurations
	trivy config --misconfig-scanners=terraform --tf-vars environment/$(env).tfvar ./src/

plan: check ws-select lint scan ## Terraform plan
	$(info creating a plan ...)
	cd ./src && terraform plan -out=tfplan -input=false -var-file=../environments/$(env).tfvar
	trivy config tfplan

apply: ## Terraform apply
	$(info applying the plan ...)
	cd ./src && terraform apply -input=false tfplan

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
