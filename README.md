# HMLR Common Styles

A Rails engine to provide common look and feel elements to the suite of HM
Land-Registry open-linked-data applications.

Please see the other repositories in the [HM Land Registry Open
Data](https://github.com/epimorphics/hmlr-linked-data/) project for more
details.

## Developer notes

Runtime dependencies are declared in `lr_common_styles.gemspec` only;
development and test tools are in the `Gemfile`. `bundle outdated
--only-explicit` skips gemspec dependencies[^1], so `make update` also runs
`bundle outdated` with the gemspec's runtime dependency names to report them.

[^1]: <https://bundler.io/man/bundle-outdated.1.html>

> [!WARNING]
> The `govuk_template`, `govuk_frontend_toolkit` and `govuk_elements_rails`
> dependencies are deprecated and will stop compiling under Dart Sass 3. See
> [docs/govuk-gems-migration.md](docs/govuk-gems-migration.md) for what uses
> them and an outline plan to move away.

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
   `autoprefixer-rails` (this gem uses them in development and CI only)

> [!NOTE]
> The gem currently uses Sprockets for asset pipeline management. As Rails and
> tooling evolve, this gem may need to be updated to maintain compatibility
> with newer asset pipeline approaches.

> [!IMPORTANT]
> **For gem consumers:** Ensure your `Gemfile` includes `dartsass-sprockets` and
> `autoprefixer-rails` to compile SCSS locally. Rails asset pre-compilation in
> your app will handle production builds.

Linting should not report any warnings:

```sh
$ rubocop
Inspecting 37 files
.....................................

37 files inspected, no offences detected
```

### Favicons

The files in `app/assets/images/favicon/` were generated from
`app/assets/images/lr-favicon.svg` using the settings in `config/favicon.json`.
They are committed, so nothing needs to run at build time.

To regenerate them (e.g. after a branding change), use
[RealFaviconGenerator](https://realfavicongenerator.net/) with the same
settings, or temporarily add the `rails_real_favicon` gem to the Gemfile and
run `rails generate favicon`. The gem was removed from the Gemfile because it
holds `rubyzip` at a vulnerable 2.x version.

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

- `ci.yml` - runs on every pull request and push to `main`: RuboCop, the
  tests on the oldest supported Ruby (the gemspec's `required_ruby_version`)
  and the latest stable Ruby, and a gem build
- `publish.yml` - builds the gem and publishes it to eGPR when a GitHub
  Release is published (see [Releasing](#releasing))

When a new Ruby is released, add it to the test matrix in `ci.yml`.

Dependabot (`.github/dependabot.yml`) opens weekly grouped PRs for gems and
GitHub Actions: runtime and development gems separately, major versions on
their own. Security updates are grouped into one PR. CI runs on each of these
PRs; triage them as described in the wiki page FE-Triaging-Dependabot.

Run `make check` locally to verify before pushing (runs `make lint` and
`make test` consecutively). Note that `make lint` auto-corrects safe offences
with `rubocop -a`; CI runs plain `rubocop`, so commit any corrections.

---

### Releasing

This gem is published to the Epimorphics GitHub Package Registry (eGPR)[^2],
where the HMLR applications install it from. A release is a `vX.Y.Z` tag plus a
published GitHub Release, which triggers `.github/workflows/publish.yml` to
build the gem and push it using the workflow's `GITHUB_TOKEN`. No personal
access token or local credentials are needed.

1. Merge everything for the release to `main` and check CI is green on every
   Ruby in the matrix
2. Bump [`lib/lr_common_styles/version.rb`](/lib/lr_common_styles/version.rb)
   following [semantic versioning](https://semver.org/) (raising the Ruby or a
   dependency lower bound is at least a minor version), rename the
   [`CHANGELOG.md`](/CHANGELOG.md) `Unreleased` section to the version and date,
   and commit: `chore(release): vX.Y.Z`. `main` is protected, so merge this
   through a pull request
3. Tag the merged commit on `main` and push the tag:

   ```sh
   git switch main && git pull
   git tag vX.Y.Z
   git push origin vX.Y.Z
   ```

4. Publish a GitHub Release from the tag:

   ```sh
   gh release create vX.Y.Z --verify-tag --generate-notes
   ```

5. Check the "Publish gem" workflow run in the Actions tab, and that the new
   version appears on the eGPR[^2]. The workflow fails without publishing if
   the tag doesn't match `LrCommonStyles::VERSION`.
6. Update consuming apps with `bundle update lr_common_styles --conservative`
   and release them as usual

To check the package contents before releasing, run `make gem` and then
`tar -xOf lr_common_styles-X.Y.Z.gem data.tar.gz | tar -tz`.

[^2]: <https://github.com/orgs/epimorphics/packages?repo_name=lr_common_styles>
