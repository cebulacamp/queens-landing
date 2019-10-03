.DEFAULT_GOAL := help

ENTRYPOINT := src/index.pug

# Porcelain
# ###############
.PHONY: env-up env-down env-recreate ci build lint test container

serve: ## run bleble
	npx parcel $(ENTRYPOINT)

ci: setup lint test build container ## run all tests and build all artifacts
	@echo "Not implemented"; false

env-up: ## set up dev environment
	@echo "Not implemented"; false

env-down: ## tear down dev environment
	@echo "Not implemented"; false

env-recreate: env-down env-up ## deconstruct current env and create another one

build: setup ## create artifact
	npx parcel build $(ENTRYPOINT)

lint: ## run static analysis
	@echo "Not implemented"; false

test: setup ## run all tests
	@echo "Not implemented"; false

container: build ## create container
	docker build -t queens-landing .


# Plumbing
# ###############
.PHONY: setup

setup:


# Utilities
# ###############
.PHONY: help
help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
