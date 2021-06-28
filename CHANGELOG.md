# LR common styles

A Ruby gem to share common styles and assets among the various LR
open data applications.

## Changes

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

- 2020-01-21 (Ian) ensure current language selection tag is preserved
  in menu actions

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
- added a local copy of the OGL logo, since the shared used by the
  gov-uk toolkit has been removed

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

- Change the Bootstrap standard washed-out red for embedded code fragments
to something less garish

- Branding update: change "Land Registry" to "HM Land Registry"
