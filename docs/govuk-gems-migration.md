# Moving away from the deprecated govuk gems

Status: **parked** (noted November 2026, during v3.1.0). Not yet scheduled.

## The problem

This gem depends on three deprecated, unmaintained gems: `govuk_template`,
`govuk_frontend_toolkit` and `govuk_elements_rails` (pinned at 3.0.2 because of
an unfixed bug; see the gemspec).

- They won't get fixes, security or otherwise.
- They are written with Sass `@import` and global colour functions, which Dart
  Sass has deprecated for removal in Dart Sass 3.0. When that lands they will
  stop compiling.
- `govuk_elements_rails` and `govuk_template` depend on the whole of `rails`, so
  our narrower `railties`/`actionpack`/`actionview` declaration (#105) doesn't
  shrink the dependency tree until they go.

## What uses them (as of v3.1.0)

**This gem** uses little directly. It has its own layout, and its SCSS uses only
`%site-width-container`, `$focus-colour` and the `ogl-symbol-41px-black` image.
`_gov_uk_refine.scss` mostly overrides govuk's `#global-header` and `#footer`
styles to give the LR look.

**Consuming apps** get the govuk gems through this gem (none lists them in its
own Gemfile) and import them directly:

| App | govuk usage |
|---|---|
| lr-landing | `@import "govuk-template"`, `"govuk-elements"`; `heading-*`, `panel` |
| ppd-explorer | same imports; `_gov-uk-tweaks.scss` |
| standard-reports-ui | same imports; `heading-*`, `panel`, `visually-hidden`, govuk footer markup |
| ukhpi | doesn't use this gem; depends on `govuk_template` directly and vendors a copy; heaviest user |

So removing the gems from the gemspec breaks those apps' imports: it's a
**major version** (4.0.0), and each app needs a change released at the same time.

## Options

1. **Bootstrap and LR's own styles** (favoured so far). Bootstrap 5 is already a
   runtime dependency and the layout already uses its grid. The LR look is
   already custom. Keeps the current Sprockets/dartsass toolchain.
2. **GOV.UK Frontend** (the design system). Would need npm packages and new
   bundling (or vendoring) in each app, and the GOV.UK brand and font have usage
   restrictions to check with HMLR. A design decision as much as a technical one.

## Outline plan (story points)

1. Spike: choose the option, list every govuk selector/mixin/variable/image used
   in the gem and apps, and take baseline screenshots (2)
2. Gem: take over what's used, with one `lr_common_styles` stylesheet entry point
   and a temporary compatibility layer for `heading-*`, `panel`,
   `visually-hidden`; drop the three gems (5)
3. Gem: release 4.0.0 with a migration note and `BREAKING CHANGE:` (1)
4. lr-landing (2), ppd-explorer (3), standard-reports-ui (3): use the entry point,
   drop govuk imports, compare with the baseline
5. ukhpi: separate track, split after the spike (8+)

Then move our own SCSS from `@import`/`lighten`/`darken` to `@use` and
`sass:color`.
