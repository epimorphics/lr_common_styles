# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'lr_common_styles/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'lr_common_styles'
  spec.version     = LrCommonStyles::VERSION
  spec.authors     = ['Epimorphics Ltd', 'Ian Dickinson']
  spec.email       = ['info@epimorphics.com']
  spec.homepage    = 'https://github.com/epimorphics/lr_common_styles'
  spec.summary     = 'LR Common Styles for Rails'
  spec.description = 'Common elements of LR open data applications as a Rails engine'
  spec.license     = 'MIT'

  # * This gem will work with ruby versions >= 3.4.0 or < 3.5...
  # * Current LR Apps that use this gem are running ruby version 3.4.4
  # * This is the latest version of Ruby that is supported by Rails 8.0
  spec.required_ruby_version = '~> 3.4'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  spec.metadata['rubygems_mfa_required'] = 'true'

  # Runtime dependencies for this gem are ALSO included in the Gemfile's
  # :maintenance group to allow bundler to validate when running the `bundle
  # outdated --only-explicit` from the `make update` target.
  spec.add_dependency 'rails', '~> 8.0'

  # ! There is a bug with a missing symlink in all 3.1 versions of
  # ! "govuk_elements_rails". There is an open PR to fix this here:
  # ! https://github.com/alphagov/govuk_elements_rails/pull/38. However, the gem
  # ! has been deprecated and is no longer maintained, and because LR Common
  # ! Styles is a gem as well, we cannot use a forked repo as a dependency. As a
  # ! result we are stuck using version 3.0.2 until further investigations provide
  # ! a better solution.
  spec.add_dependency 'govuk_elements_rails', '3.0.2'
  spec.add_dependency 'govuk_frontend_toolkit', '~> 9.0'
  spec.add_dependency 'govuk_template', '~> 0.26.0'

  # Asset compilation tools (dartsass-sprockets, autoprefixer-rails) are
  # development-only for this gem. Consuming applications manage asset
  # compilation independently with their own configurations and tooling.
  spec.add_dependency 'bootstrap', '~> 5.3.2'
  spec.add_dependency 'font-awesome-rails', '~> 4.7.0'
  spec.add_dependency 'haml-rails', '~> 3.0'
  spec.add_dependency 'jquery-rails', '~> 4.6'
  spec.add_dependency 'lodash-rails', '~> 4.17'
  spec.add_dependency 'modernizr-rails', '~> 2.7'
  spec.add_dependency 'modulejs-rails', '~> 2.2.0'
end
