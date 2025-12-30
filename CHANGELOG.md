# LR common styles

A Ruby gem to share common styles and assets among the various LR open data
applications.

## Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.4.0] - 2025-12-30

### Added

- Adds a `help` target in the Makefile to list available commands
- Introduced Propshaft asset pipeline support (Rails 8+) alongside existing
  Sprockets compatibility
- Refactored Engine initialiser to automatically register framework gem asset
  paths (govuk_template, govuk_elements_rails, bootstrap-sass,
  font-awesome-rails, govuk_frontend_toolkit)
- Added development environment logging for asset path registration in debug
  mode
- Added `make compile` target to clobber and precompile gem assets; also run via
  make assets for consistent builds
- Includes code guards to ensure asset pipeline configuration only runs when
  assets pipeline is available

### Changed

- Replaced `sass-rails` with `dartsass-rails` as primary SCSS compiler
  dependency
- Refactored SCSS entrypoint (`lr_common_styles.scss`) to contain only internal
  Common Styles imports; host applications are now responsible for importing
  framework dependencies
- Updated `app/assets/config/manifest.js` to remove incorrect stylesheet
  directory link and duplicate build references
- Test dummy app configuration also now guards asset configuration with
  `respond_to?(:assets)` check for compatibility with Propshaft/Sprockets
- Gem initialiser configuration now conditional on asset pipeline presence,
  enabling seamless operation in both Sprockets and Propshaft environments

### Fixed

- Clarified asset dependency structure through updated documentation in SCSS
  entrypoint
- Removed misleading configuration directives that conflicted with host
  application asset compilation

## [2.3.1] - 2025-10

### Changed

- Rails framework was upgraded from 8.0.2.1 to 8.1.1 for security and
  compatibility
- Development dependencies were updated including rbs (3.9.5), rexml (3.4.4),
  solargraph (0.57.0), and rubocop
- Dependency version constraints were relaxed from `rails ~> 8.0.0` to `rails ~>
  8.0` for broader compatibility
- Haml-rails dependency constraint was updated from `~> 2.1` to `~> 3.0` to
  support newer haml versions
- Multiple core dependencies were bumped to latest patch versions for security
  and stability
- Locked dependency versions were updated to latest compatible releases

### Fixed

- Security vulnerabilities were resolved through dependency updates
- Compatibility issues with newer dependency versions were addressed

## [2.3.0] - 2025-08

### Changed

- Framework and related libraries were bumped to latest patch versions
- Patch versions for multiple development and runtime dependencies were updated
- Minimum required version for a key style package was increased
- Dependency versions were aligned across manifests and specs
- Package manager version in lockfile was upgraded

## [2.2.2] - 2025-07

### Changed

- `TargetRubyVersion` was changed from 3.3 to 3.4 in the configuration
- Patch version was incremented from 2.2.1 to 2.2.2
- `govuk_template` gem was updated from 0.18.3 to 0.26.0
- `rubocop` gem was upgraded from 1.77.0 to 1.78.0
- `rubocop-ast` gem was upgraded from 1.45.1 to 1.46.0
- `rdoc` gem was updated from 6.14.1 to 6.14.2
- `tilt` gem was updated from 2.6.0 to 2.6.1
- `io-console` gem was upgraded from 0.8.0 to 0.8.1
- `erb` gem was changed from 5.0.1 to 5.0.2
- `json` gem was updated from 2.12.2 to 2.13.0
- Version constraints in the `lr_common_styles.gemspec` and `Gemfile.lock` were
  adjusted

## [2.2.1] - 2025-06

### Added

- Environment title to headers was added for better developer awareness

### Changed

- Ruby version was bumped to 3.4.4
- Multiple gems were updated improving compatibility and performance
- Branch checks in hooks were refined for clearer workflow
- Commit and test messages were enhanced for informativeness

## [2.2.0] - 2025-06

### Added

- Fallback value for Google Analytics ID was added
- Configuration initialiser to set Google Analytics ID using environment
  variables was initiated
- HTML attributes were enhanced to include Google Analytics ID for script access

### Changed

- Hard coded Google Analytics ID was replaced with retrieval from a data
  attribute in the HTML
- Used data attributes are now deleted after they are utilised

## [2.1.5] - 2025-05

### Added

- Test execution in post-commit git hooks was implemented, improving code
  quality and reliability

### Changed

- Rails version was bumped to 8.0
- Cookie management and analytics loading were enhanced, improving user privacy
- App link generation was improved, allowing multiple CSS classes
- Configuration was fixed to preserve the `to_time` timezone
- Rendering of checkboxes and details in forms was improved, improving the user
  experience
- Pre-push was refactored

## [2.1.4] - 2025-02

### Added

- Changelog generation configuration file was added
- Pre-commit and pre-push hooks were added
- Development and test gems were added
- Lint task to Makefile was added
- Responsive list style reset for ordered and unordered lists was added
- Google Analytics for production only was added

### Changed

- CHANGELOG was updated to reflect new format changes and entries since version
  2.0.0
- Changelog generation in pre-commit hook was disabled due to issues with tool
  configuration
- Erroneous commit messages from changelog were removed
- Message for no Ruby on Rails changes in pre-commit hook was clarified
- Version was updated to 2.1.4
- README was updated for clarity and eGPR details
- Header link class was updated for accessibility
- Homepage links in locale files were updated
- Layout and comments were cleaned up
- Puma stats display format was updated
- Gemspec was updated for better compatibility and authorship
- Require syntax was updated and initialisers were cleaned up
- Copyright holder in license file was updated
- RuboCop config was updated for better linting
- Changelog entries wording was fixed
- Changelog typo was fixed

## [2.1.3] - 2024-11

### Changed

- Version in `Gemfile.lock` was updated (take 2)

## [2.1.2] - 2024-10

### Changed

- Version in `Gemfile.lock` was updated

## [2.1.1] - 2024-10

### Added

- Version specification for the `govuk_elements_rails` gem was added. This is
  because all later versions have a symlink bug. Also, the gem is deprecated
  and will receive no further updates.

## [2.1.0] - 2024-10

### Changed

- Rails was upgraded to `7.2.1`

## [2.0.0] - 2024-09

### Changed

- Ruby version was updated to 3.3.5

---

## 1.9.9 - 2024-09

- (Jon) Moved the `puma stats` haml to it's own partial as well as added the
  `puma stats` partial to the footer of the application template. This will
  allow the `puma stats` output to be displayed on the HMLR apps that use this
  gem. The `puma stats` output will only be displayed in development mode.

## 1.9.8 - 2024-09

- (Jon) Implemented the dependabot PR #55 to update jquery-rails requirement
  from ~> 4.3.5 to >= 4.3.5, < 4.7.0

## 1.9.7 - 2024-09

- (Jon) Resolves issue with the root url `/`  being set to `/app/` when the
  landing page app is running in production mode. This resolves the urls paths
  for the apps to the landing page, but does not change the links to the apps
  themselves.

## 1.9.6 - 2024-08

- (Jon) Additional improvements for the suite of apps that use this gem to
  ensure the menu links are built correctly alongside including the appropriate
  classes and/or attributes for accessibility and usability

## 1.9.5 - 2024-08

- (Dan) Updates page title tag so we can update the page titles in various repos
  to improve accessibility
  [116](https://github.com/epimorphics/standard-reports-ui/issues/116),
  [220](https://github.com/epimorphics/ppd-explorer/issues/220) and
  [409](https://github.com/epimorphics/ukhpi/issues/409)

## 1.9.4 - 2024-08

- (Dan) Adds underline to link text for the feedback section to meet
  accessibility requirments
  [114](https://github.com/epimorphics/standard-reports-ui/issues/114)
- (Dan) Adds underline to link text in the cookie banner to meet accessibility
  requirments [126](https://github.com/epimorphics/lr-landing/issues/126)

## 1.9.3 - 2023-11-27

- (Jon) If the app is running in production, and the `relative_url_root`
  excludes `/app`, then the app name is appended to the relative_url_root of
  `/app` This resolves the urls paths for the apps from the landing page, but
  not for the apps themselves

## 1.9.2 - 2023-11-23

- (Jon) Resolves locked ruby version conflict created by using the `=` for the
  `required_ruby_version` specification, this prevented associated rails apps
  which are using a release version of ruby (e.g. `v2.6.6.146`) from building
- (Jon) Incremented version cadence of gem from `v1.9.1.2` to `v1.9.2` to
  reflect the changes made to the gemspec

## 1.9.1.2 - 2023-04-19

- (Jon)  updated static file settings to current format
- (Jon)  incremented version cadence

## 1.9.1.1 - 2023-03-10

- (Jon) Updated the gemspec to ensure the gem is locked to the same 2.6.6 ruby
  version to reduce any potential issues with current app integrations
- (Jon) Removed dependency version locks due to connected apps not supporting
  newer versions of gems being used.
- (Jon) Updated version cadence using new suffix to reflect the adjustments with
  development and build dependency approach

## 1.9.1 - 2023-03-07

- (Jon) Updated the gemspec to ensure the dependency versions are locked to
  specific base versions to avoid any potential issues with the gem being used
- (Jon) Minor text changes to the .gemspec file to update the summary field to
  mirror the common fields set in other gems.
- (Jon) Refactored the version cadence creation to include a SUFFIX value if
  provided; otherwise no SUFFIX is included in the version number.

## 1.9.0

- 2022-03-22 (Ian) Add support for publishing gem to GPR

## 1.8.5

- 2021-06-29 (Joseph) Fix for breaking syntax error.

## 1.8.4

- 2021-06-28 (Joseph) Update gem dependencies

## 1.8.3

- 2021-06-28 (Joseph) Add link to privacy notice to the footer

## 1.8.2

- 2021-06-24 (Joseph) Add localised copy for Wales to cookie notice

## 1.8.1

- 2021-06-11 (Joseph) Bug fix for errant ES6 syntax

## 1.8.0

- 2021-06-11 (Joseph) Add cookie permission dialog

## 1.7.2

- 2021-04-28 (Ian) Fix error in contact email address

## 1.7.1

- 2020-01-21 (Ian) ensure current language selection tag is preserved in menu
  actions

## 1.7.0 - 2020-10-01 (Ian)

- Improved support for Welsh localisation in header and footer
- added lang-switcher partial

## 1.6.3 - 2020-09-22 (Ian)

- change to pass the accessibility doc path via the Rails config

## 1.6.1 - 2020-09-22 (Ian)

- add link to accessibility statement

## 1.6.0 - 2020-09-22 (Ian)

- added skip-to-main-content partial

## 1.5.0 - 2020-09-14 (Ian)

A number of changes in support of improved WCAG compliance (GH-15):

- changed the colour of the header menu elements to increase contrast
- removed the 'BETA' phase tag, as it is obsolete
- introducted a new feedback option at the page footer
- ensured that all links have `aria-label` if needed
- ensured that all images have alt tags
- added a local copy of the OGL logo, since the shared used by the gov-uk
  toolkit has been removed

## 1.4.12 - 2020-07-06

- Update dependencies to address CVE warnings

## 1.4.11 - 2019-11-15

- Automatically show the `Version::VERSION` in the page footer

## 1.4.10 - 2019-11-15

- Updated gem dependencies to address CVE-2019-15587

## 1.4.9 - 2019-10-09

- Updated gem dependencies, especially to address CVE-2019-16892

## 1.4.8 - 2019-07-17

- Updated gem dependencies

## 1.4.7 - 2019-06-03

- Added a muted style for placing version information in the application footer

## 1.4.0 - 2017-03-30

- Change the Bootstrap standard washed-out red for embedded code fragments to
something less garish

- Branding update: change "Land Registry" to "HM Land Registry"
