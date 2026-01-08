# TODO

## Pre-Release Tasks

- [ ] Run `make check` to verify linting and tests pass
- [ ] Build gem locally with `make gem` to verify packaging
- [ ] Test gem with consuming apps using local path in Gemfile
- [ ] Verify Bootstrap/Popper load correctly in lr-landing and ppd-explorer
- [ ] Run `bundle install` in consuming apps to update lockfiles

## Release Tasks

- [ ] Publish gem version 3.0.0 to eGPR via GitHub Actions workflow
- [ ] Tag release in git with `v3.0.0`
- [ ] Verify gem appears in eGPR package registry
- [ ] Update consuming apps to use published gem version

## Post-Release Tasks

- [ ] Remove local path overrides in consuming apps' Gemfiles
- [ ] Deploy consuming apps with new gem version to test environments
- [ ] Monitor for any asset pipeline or Bootstrap-related issues
- [ ] Document any migration steps for other consuming apps not yet updated
