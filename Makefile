.PHONY: help init lint update

help:
	@echo AVAILABLE COMMANDS
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-23s\033[0m%s\n", $$1, $$2}'

init: ## Initialise repo for local development
	@poetry install -v
	@! test -d ~/.cache/pre-commit || poetry run pre-commit clean
	@poetry run pre-commit install -f --install-hooks

lint: ## Lint bundle files
	@poetry run yamllint -d relaxed bundle

update: ## Update catalog and app images in docker-compose.yml to specified version
	@test -n '$(VERSION)' || (echo "'VERSION' not set"; exit 1)
	@sed -Ei -e 's/(image: matatika\/(catalog|app)).*/\1:$(VERSION)/g' bundle/docker-compose.yml
