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
  s.required_ruby_version = '~> 2.6.6'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.metadata['rubygems_mfa_required'] = 'true'

  s.add_dependency 'bootstrap-sass', '~> 3.4.0'
  s.add_dependency 'font-awesome-rails', '~> 4.7.0.1'
  s.add_dependency 'govuk_elements_rails', '~> 2.0.0'
  s.add_dependency 'govuk_frontend_toolkit', '~> 4.18.1'
  s.add_dependency 'govuk_template', '~> 0.18.1'
  s.add_dependency 'haml-rails', '~> 2.0.0'
  s.add_dependency 'jquery-rails', '>= 4.3.5', '< 4.7.0'
  s.add_dependency 'lodash-rails', '~> 4.17.14'
  s.add_dependency 'modernizr-rails', '~> 2.7.1'
  s.add_dependency 'modulejs-rails', '~> 2.2.0.0'
  s.add_dependency 'rails', '~> 5.2.4'
  s.add_dependency 'sass-rails', '~> 5.0.4'

  s.add_development_dependency 'minitest-rails'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rails_real_favicon'
end
