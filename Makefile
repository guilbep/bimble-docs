.PHONY: help docs docs-serve clean

help: ## This list
	@grep -E '^[a-z-]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-12s %s\n", $$1, $$2}'

# Strict: a broken link or a missing page fails the build.
docs: ## Build the manual into site/ (strict)
	uvx --from zensical==0.0.72 zensical build --strict

docs-serve: ## Preview the manual on localhost, rebuilt on save
	uvx --from zensical==0.0.72 zensical serve

clean: ## Remove the built site
	rm -rf site/
