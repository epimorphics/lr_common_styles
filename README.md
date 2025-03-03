# HMLR Common Styles

A Rails engine to provide common look and feel elements to the suite of HM
Land-Registry open-linked-data applications.

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

---

### Publishing the gem to the Epimorphics GitHub Package Registry (eGPR)[^1]

This gem is made available to the various HMLR applications via the eGPR.

Note that in order to publish to the eGPR, you'll need a GitHub Personal Access
Token (PAT) with the appropriate permissions set.

> [!TIP]
> There are [instructions on the Epimorphics
> wiki](https://github.com/epimorphics/internal/wiki/Ansible-CICD#creating-a-pat-for-gpr-access)
> for creating a new PAT if you don't have one.
> Once created, you can use the same PAT in multiple projects, you don't need to
> create a new one each time.

#### Publishing an updated version of the gem is then a manual process

1. Make the required code changes, and have them reviewed by other members of
   the team
2. Update [`CHANGELOG.md`](/CHANGELOG.md) with the changes made
3. Update the proper version cadence found in the
   [`lib/lr_common_styles/version.rb`](/lib/lr_common_styles/version.rb)
   following [semantic versioning principles](https://semver.org/)
4. Check that the gem builds correctly locally by running the command: `make
   gem` in a terminal window
5. Visit the [project
   repository](https://github.com/epimorphics/lr_common_styles), navigate to the
   "[Actions](https://github.com/epimorphics/lr_common_styles/actions)" tab, and
   select the "Release and Publish Gem" workflow from the listing on the left
    - Click the "Run workflow" button on the right top of the workflow runs
      listing
    - Choose the `master` branch to run the workflow on
    - Click the "Run workflow" button below the branch selection
6. When the workflow has completed, check on the eGPR[^1] to see that the new
   gem has been published successfully

[^1]: <https://github.com/orgs/epimorphics/packages?repo_name=lr_common_styles>
