# LR common styles

A Ruby gem to share common styles and assets among the various LR open data
applications.

## Changes

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
