.DEFAULT_GOAL := help

ENTRYPOINT := src/index.pug


# Porcelain
# ###############
.PHONY: serve build lint test container

serve: setup ## run bleble
	npx parcel $(ENTRYPOINT)

build: setup clean ## create artifact
	npx parcel build $(ENTRYPOINT)

lint: ## run static analysis
	@echo "Not implemented"; false

test: setup ## run all tests
	@echo "Not implemented"; false

container: build ## create container
	docker build -t queens-landing .


# Plumbing
# ###############
.PHONY: setup push-container-image clean

push-container-image: container
	docker tag queens-landing allgreed/queens-landing:preview$(VERSION)
	docker push allgreed/queens-landing:preview$(VERSION)

setup: node_modules

node_modules: package.json yarn.lock
	yarn install --frozen-lockfile

clean:
	rm -rf dist


# Utilities
# ###############
.PHONY: help todo clean init
init: ## one time setup
	direnv allow .


help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
