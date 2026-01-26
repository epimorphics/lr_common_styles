# HMLR Common Styles

A Rails engine to provide common look and feel elements to the suite of HM
Land-Registry open-linked-data applications.

Please see the other repositories in the [HM Land Registry Open
Data](https://github.com/epimorphics/hmlr-linked-data/) project for more
details.

## Developer notes

> [!IMPORTANT]
> Gem dependencies should be recorded in the Gemfile, not in the .gemspec, due
> to a "quirk" with the `bundler outdated` utility not checking gmes listed in
> the .gemspec when using the `--only-explicit` flag when running the `make
> update` target command.

### How this gem works

This is a Rails engine that provides shared UI components, styles, and assets
to consuming applications. When a consuming app includes this gem, Rails
automatically loads the engine via `lib/lr_common_styles/engine.rb`, making all
gem assets and views available to the consuming app.

**Asset pipeline integration:**

Assets from `app/assets/` (SCSS, images, javascripts) are exposed to consuming
apps through Sprockets; see [Asset Pipeline & Compilation](#asset-pipeline--compilation)
for how they are compiled and how runtime dependencies load.

**Customisation:**

Consuming apps can override and customise gem components in several ways:

**1. Override Styles:**
Define SCSS in your app's `app/assets/stylesheets/` with higher specificity:

```scss
// app/assets/stylesheets/overrides.scss
// This will override gem styles
.navbar {
   background-color: var(--custom-colour);
}
```

**2. Customise Partials:**
Create a partial with the same path in your consuming app to override it:

```sh
# Gem provides:
app/views/lr_common_styles/layouts/_header.html.haml

# Your app overrides by creating:
app/views/lr_common_styles/layouts/_header.html.haml
```

Rails looks in your app's `app/views/` directory first, so your custom partial
takes precedence.

**3. Engine Initialisation:**
Engine initialisers in `config/initializers/` run when the gem loads, applying
configuration like Google Analytics setup (see
`config/initializers/google_analytics.rb`).

**View Helpers & Partials:**
All code in `app/views/`, `app/helpers/`, and `app/controllers/` from the gem
becomes available to consuming apps as if they were part of the consuming app
itself.

### Asset pipeline & compilation

This gem provides source SCSS and assets that are compiled by consuming
applications. The gem does **not** ship pre-compiled CSS. When included in a
consuming app:

- Assets from `app/assets/` (SCSS, images, javascripts) are merged into the
   consuming app's asset pipeline via Sprockets
- Runtime dependencies are required in `lib/lr_common_styles.rb` (Bootstrap,
   font-awesome-rails, jQuery, etc.) and load with the gem
- Consuming apps compile SCSS using their own `dartsass-sprockets` and
   `autoprefixer-rails` (see `.github/workflows/test.yml` for CI setup)

> [!NOTE]
> The gem currently uses Sprockets for asset pipeline management. As Rails and
> tooling evolve, this gem may need to be updated to maintain compatibility
> with newer asset pipeline approaches.

**For gem consumers:** Ensure your `Gemfile` includes `dartsass-sprockets` and
`autoprefixer-rails` to compile SCSS locally. Rails asset pre-compilation in
your app will handle production builds.

Linting should not report any warnings:

```sh
$ rubocop
Inspecting 37 files
.....................................

37 files inspected, no offences detected
```

### Local testing with consuming apps

To test changes to this gem in a consuming application (e.g., lr-landing), use
a local path reference instead of the published gem. Most consuming applications
include commented-out guidance in their `Gemfile`:

```ruby
# NOTE: While running the Rails app locally for testing you can set gems to
# your local path
# ! These "local" paths do not work with a Docker image - use the repo instead
gem 'lr_common_styles', path: '~/Epimorphics/clients/land-registry/projects/lr_common_styles'
```

**Workflow:**

1. Uncomment or add the local path reference in the consuming app's `Gemfile`
2. Run `bundle install` in the consuming app
3. Start the consuming app server and verify your gem changes work correctly
4. Once validated, revert the `Gemfile` to use the published gem version

This approach allows you to test gem changes without publishing a new version.
Note that local paths do not work in Docker builds; use the published gem
version for containerised deployments.

### Continuous integration

GitHub Actions automates testing and publishing. See `.github/workflows/` for:

- `test.yml` - runs on every push/PR (linting, unit tests)
- `release-and-publish-gem.yml` - publishes to eGPR on manual trigger

Run `make check` locally to verify before pushing (runs `make lint` and
`make test` consecutively).

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
