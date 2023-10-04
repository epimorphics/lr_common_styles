# HMLR Common Styles

A Rails engine to provide common look and feel elements to the suite
of HM Land-Registry open-linked-data applications.

Please see the other repositories in the [HM Land Registry Open
Data](https://github.com/epimorphics/hmlr-linked-data/) project for more
details.

## Developer notes

There's not much code here, just shared CSS styles etc.

Linting should not report any warnings:

```sh
$ rubocop
Inspecting 37 files
.....................................

37 files inspected, no offenses detected
```

### Publishing the gem to GPR

This gem is made available to the various HMLR applications via GitHub Package
Registry (GPR).

Note that in order to publish to the Epimorphics section of the GPR, you'll
need a GitHub personal access token (PAT). There are [instructions on the Epimorphics
wiki](https://github.com/epimorphics/internal/wiki/Ansible-CICD#creating-a-pat-for-gpr-access)
for creating a new PAT if you don't have one. Once created, you can use the
same PAT in multiple projects, you don't need to create a new one each time.

Publishing an updated version of the gem is a manual process:

1. Make the required code changes, and have them reviewed by other members of
   the team
2. Update `CHANGELOG.md` with the changes. Update
   `lib/lr_common_styles/version.rb` following semantic version principles
3. Check that the gem builds correctly: `make gem`
4. Publish the new gem to GPR: `make publish`
5. Check on the [GitHub Package
   Registry](https://github.com/orgs/epimorphics/packages?repo_name=lr_common_styles)
   to see that the new gem has been published.
