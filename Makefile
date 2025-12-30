.PHONY: auth clean gem publish test

NAME?=lr_common_styles
OWNER?=epimorphics
VERSION?=$(shell ruby -e 'require "./lib/${NAME}/version" ; puts LrCommonStyles::VERSION')
PAT?=$(shell read -p 'Github access token:' TOKEN; echo $$TOKEN)

AUTH=${HOME}/.gem/credentials
GEM=${NAME}-${VERSION}.gem
GPR=https://rubygems.pkg.github.com/${OWNER}
SPEC=${NAME}.gemspec

${AUTH}:
	@mkdir -p ${HOME}/.gem
	@echo '---' > ${AUTH}
	@echo ':github: Bearer ${PAT}' >> ${AUTH}
	@chmod 0600 ${AUTH}

${GEM}: ${SPEC} ./lib/${NAME}/version.rb
	gem build ${SPEC}

all: publish

assets: auth bundle compile ## Compile assets for gem distribution
	@echo assets completed.

auth: ${AUTH} ## Set up authentication for GitHub Packages
	@echo "Authentication set up for GitHub Packages."

build: gem ## Build the gem package

bundle: ## Install Ruby gems via Bundler
	@echo "Installing Ruby gems via Bundler..."
	@bundle install

checks: lint test ## Run all checks: linting and tests
	@echo "All checks passed."

clean: ## Clean up gem files
	@echo "Cleaning up ${GEM} files..."
	@rm -rf ${GEM}

compile: ## Compile assets for gem distribution
	@echo "Removing old compiled assets and compiling ..."
	@rake assets:clobber assets:precompile

gem: ${GEM} ## Alias for `gem` target
	@echo ${GEM}

help: ## Display this message
	@echo "Available make targets:"
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-20s %s\n", $$1, $$2}'
	@echo ""
	@echo "Environment variables (optional: all variables have defaults):"
	@make vars

lint: assets ## Run linting checks
	@echo "Running rubocop..."
	@bundle exec rubocop

publish: ${AUTH} ${GEM} ## Publish the gem to GitHub Packages
	@echo Publishing package ${NAME}:${VERSION} to ${OWNER} ...
	@gem push --key github --host ${GPR} ${GEM}
	@echo Done.

realclean: clean ## Remove all generated files including authentication
	@rm -rf ${AUTH}

tags: ## Show version tags
	@echo version=${VERSION}

test: assets ## Run tests in the dummy application
	@echo "Running tests..."
	@rake test

vars: ## Show important variables
	@echo "GEM"	= ${GEM}
	@echo "GPR"	= ${GPR}
	@echo "NAME = ${NAME}"
	@echo "OWNER = ${OWNER}"
	@echo "SPEC = ${SPEC}"
	@echo "VERSION = ${VERSION}"
