# frozen_string_literal: true

source 'https://rubygems.org'

# Declare your gem's information in lr_common_styles.gemspec.
gemspec

# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
group :maintenance do
  # Runtime dependencies for this gem (as declared in the gemspec) are included
  # here to allow bundler to validate when running the `bundle outdated
  # --only-explicit` from the `make update` target.

  # Versions should be kept in sync with those in the .gemspec
  gem 'rails', '~> 8.0'
  gem 'govuk_elements_rails', '3.0.2'
  gem 'govuk_frontend_toolkit', '~> 9.0'
  gem 'govuk_template', '~> 0.26.0'
  gem 'bootstrap', '~> 5.3.2'
  gem 'font-awesome-rails', '~> 4.7.0'
  gem 'haml-rails', '~> 3.0'
  gem 'jquery-rails', '~> 4.6'
  gem 'lodash-rails', '~> 4.17'
  gem 'modernizr-rails', '~> 2.7'
  gem 'modulejs-rails', '~> 2.2.0'
end

# Declare any dependencies that are used in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git.

group :development, :test do
  gem 'autoprefixer-rails'
  gem 'byebug'
  gem 'dartsass-sprockets', '~> 3.2'
end

group :test do
  gem 'minitest-rails'
  gem 'mocha'
  gem 'simplecov', require: false
end

group :development do
  gem 'popper_js', '~> 2.11', '>= 2.11.8'
  gem 'rails_real_favicon'
  gem 'rubocop'
  gem 'rubocop-ast'
  gem 'rubocop-rails'
  gem 'ruby-lsp'
  gem 'solargraph'
end
