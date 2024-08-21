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

auth: ${AUTH}

build: gem

clean:
	@rm -rf ${GEM}

gem: ${GEM}
	@echo ${GEM}

publish: ${AUTH} ${GEM}
	@echo Publishing package ${NAME}:${VERSION} to ${OWNER} ...
	@gem push --key github --host ${GPR} ${GEM}
	@echo Done.

realclean: clean
	@rm -rf ${AUTH}

tags:
	@echo version=${VERSION}

test: gem
	@bundle install
	@rake test

vars:
	@echo "GEM"	= ${GEM}
	@echo "GPR"	= ${GPR}
	@echo "NAME = ${NAME}"
	@echo "OWNER = ${OWNER}"
	@echo "SPEC = ${SPEC}"
	@echo "VERSION = ${VERSION}"
