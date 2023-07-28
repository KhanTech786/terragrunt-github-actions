.PHONY: help metadata
export PATH := $(PWD)/bin:$(PATH)

help: ## show this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

tfenv: ## installs tfenv to $HOME/.tfenv
	./scripts/terraform.sh tfenv

plugins: ## downloads provider plugins from the user defined list
	./scripts/terraform.sh plugins ~/.terraform.d/plugins/linux_amd64 terraform-plugins

terragrunt: ## installs terragrunt to ./bin/terragrunt
	./scripts/terraform.sh terragrunt

dependencies: tfenv plugins terragrunt ## installs tfenv, terraform plugins and terragrunt

metadata: ## creates metadata vars file
	./live/metadata.yaml.sh

list-live-modules: ## lists terragrunt root modules in the target directory
	@find $(DIR) -name **terragrunt.hcl'|grep -v '.terragrunt-cache' | xargs dirname

terragrunt-init: metadata ## runs terragrunt init on the target directory cd $(DIR) && terragrunt init

terragrunt-plan: terragrunt-init metadata ##*runs terragrunt plan on the target directory
	cd $(DIR) && terragrunt plan

terragrunt-apply: metadata ## runs terragrunt apply on the target directory
	cd $(DIR) && terragrunt apply -auto-approve

terragrunt-init-all: metadata ## runs terragrunt init on live modules
	find $(DIR) -not -path '*/.terragrunt-cache/*' -not -path '$(DIR)/terragrunt.hcl' -type f -name terragrunt.hcl -execdir terragrunt init \;

terragrunt-plan-all: metadata ## runs terragrunt plan-all on the live environment path
	cd $(DIR) && terragrunt plan-all

terragrunt-apply-all: metadata ## runs terragrunt apply-all on the live environment path 
	cd $(DIR) && TF_INPUT=0 terragrunt apply-all

terragrunt-destroy-all: metadata ## runs terragrunt destroy-all on the live environment path 
	cd $(DIR) && TF_INPUT=0 /bin/terragrunt destroy-all

