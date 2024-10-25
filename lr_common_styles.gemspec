# frozen-string-literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'lr_common_styles/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lr_common_styles'
  s.version     = LrCommonStyles::VERSION
  s.authors     = ['Epimorphics Ltd']
  s.email       = ['info@epimorphics.com']
  s.homepage    = 'https://github.com/epimorphics/lr_common_styles'
  s.summary     = 'LR Common Styles for Rails'
  s.description = 'Common elements of LR open data applications as a Rails engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.metadata['rubygems_mfa_required'] = 'true'

  s.add_dependency 'rails'

  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'govuk_elements_rails', '3.0.2'
  s.add_dependency 'govuk_frontend_toolkit'
  s.add_dependency 'govuk_template'
  s.add_dependency 'haml-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'lodash-rails'
  s.add_dependency 'modernizr-rails'
  s.add_dependency 'modulejs-rails'
  s.add_dependency 'sass-rails'

  s.add_development_dependency 'minitest-rails'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rails_real_favicon'
end
