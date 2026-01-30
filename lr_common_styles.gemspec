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
end
