.PHONY: all assets build bundles check checks clean coverage gem help lint rubocop test update vars

GEM_NAME?=lr_common_styles
VERSION?=$(shell ruby -e 'require "./lib/${GEM_NAME}/version" ; puts LrCommonStyles::VERSION')
BUNDLE?=bundle

GEM=${GEM_NAME}-${VERSION}.gem
SPEC=${GEM_NAME}.gemspec

# Build the gem package
${GEM}: ${SPEC} ./lib/${GEM_NAME}/version.rb
	gem build ${SPEC}

all: check ## Default target: run all checks

assets: bundles ## Build assets for gem package
	@echo assets completed.

build: clean gem ## Build the gem package

bundles: ## Install gem dependencies via Bundler
	@echo "Installing gem dependencies via Bundler..."
	@${BUNDLE} install

check: checks ## Alias for `checks` target

checks: lint test ## Run all checks: linting and tests
	@echo "All checks passed."

clean: ## Clean up generated gem package
	@echo "Removing ${GEM} ..."
	@rm -rf ${GEM}

coverage: ## Display test coverage report
	@open coverage/index.html
	@echo "Displaying test coverage report in browser..."

gem: ${GEM} ## Build the gem package
	@echo ${GEM}

help: ## Display this message
	@echo "Available make targets:"
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-20s %s\n", $$1, $$2}'
	@echo ""
ifdef AWS_PROFILE
	@echo "Environment variables (optional: all variables have defaults):"
	@make vars
else
	@echo "Warning: AWS_PROFILE environment variable is not set. AWS CLI commands may fail."
	@echo "Re-run with AWS_PROFILE set to see all variables"
endif

lint: rubocop ## Run linting checks
	@echo "All linting complete."

rubocop: ## Run RuboCop linting
	@echo "Running RuboCop linting for ${GEM} ..."
# Auto-correct offenses safely where possible with the `-a` flag
	@${BUNDLE} exec rubocop -a

test: ## Run tests
	@echo "Running tests ..."
	@${BUNDLE} exec rake test

update: ## Review and update dependencies interactively
	@echo "Checking for outdated dependencies..."
	@if [ -f package.json ]; then \
		echo "Running yarn upgrade-interactive..."; \
		yarn upgrade-interactive; \
	fi
	@echo "Running bundle outdated to check Ruby gems..."
# Let bundler handle output; treat this as informational even if deps are outdated
	@${BUNDLE} outdated --only-explicit || true
# --only-explicit skips gemspec dependencies, so name them explicitly
	@echo "Checking runtime dependencies from ${SPEC}..."
	@${BUNDLE} outdated $$(ruby -e 'puts Gem::Specification.load("${SPEC}").runtime_dependencies.map(&:name)') || true

vars: ## Display environment variables
	@echo "GEM"	= ${GEM}
	@echo "GEM_NAME = ${GEM_NAME}"
	@echo "SPEC = ${SPEC}"
	@echo "VERSION = ${VERSION}"
