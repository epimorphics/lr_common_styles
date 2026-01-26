# frozen_string_literal: true

source 'https://rubygems.org'

# Declare your gem's information in lr_common_styles.gemspec.
gemspec

# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.

gem 'rails', '~> 8.0'

# ! There is a bug with a missing symlink in all 3.1 versions of
# ! "govuk_elements_rails". There is an open PR to fix this here:
# ! https://github.com/alphagov/govuk_elements_rails/pull/38. However, the gem
# ! has been deprecated and is no longer maintained, and because LR Common
# ! Styles is a gem as well, we cannot use a forked repo as a dependency. As a
# ! result we are stuck using version 3.0.2 until further investigations provide
# ! a better solution.
gem 'govuk_elements_rails', '3.0.2'
gem 'govuk_frontend_toolkit', '~> 9.0'
gem 'govuk_template', '~> 0.26.0'

# Asset compilation tools (dartsass-sprockets, autoprefixer-rails) are
# development-only for this gem. Consuming applications manage asset
# compilation independently with their own configurations and tooling.
gem 'bootstrap', '~> 5.3.2'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'haml-rails', '~> 3.0'
gem 'jquery-rails', '~> 4.6'
gem 'lodash-rails', '~> 4.17'
gem 'modernizr-rails', '~> 2.7'
gem 'modulejs-rails', '~> 2.2.0'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'minitest-rails'
  gem 'mocha'
  gem 'simplecov', require: false
end

group :development do
  gem 'autoprefixer-rails'
  gem 'dartsass-sprockets', '~> 3.2'
  gem 'popper_js', '~> 2.11', '>= 2.11.8'
  gem 'rails_real_favicon'
  gem 'rubocop'
  gem 'rubocop-ast'
  gem 'rubocop-rails'
  gem 'ruby-lsp'
  gem 'solargraph'
end
