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

  # This gem will work with 3.3.5 or greater...
  spec.required_ruby_version = '~> 3.3'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_dependency 'rails', '~> 8.0.0'

  spec.add_dependency 'bootstrap-sass'
  spec.add_dependency 'font-awesome-rails'
  # There is a bug with a missing symlink in all 3.1 versions of
  # "govuk_elements_rails". There is an open PR to fix this here:
  # https://github.com/alphagov/govuk_elements_rails/pull/38. However, the gem
  # has been deprecated and is no longer maintained, and because LR Common
  # Styles is a gem as well, we cannot use a forked repo as a dependency. As a
  # result we are stuck using version 3.0.2 until further investigations provide
  # a better solution.
  spec.add_dependency 'govuk_elements_rails', '3.0.2'
  spec.add_dependency 'govuk_frontend_toolkit'
  spec.add_dependency 'govuk_template'
  spec.add_dependency 'haml-rails'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'lodash-rails'
  spec.add_dependency 'modernizr-rails'
  spec.add_dependency 'modulejs-rails'
  spec.add_dependency 'sass-rails'
end
