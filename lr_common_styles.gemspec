$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'lr_common_styles/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lr_common_styles'
  s.version     = LrCommonStyles::VERSION
  s.authors     = ['Ian Dickinson']
  s.email       = ['ian.dickinson@epimorphics.com']
  s.homepage    = 'https://github.com/epimorphics/lr_common_styles'
  s.summary     = 'Common elements of LR open data applications as a Rails engine'
  s.description = 'Common elements of LR open data applications as a Rails engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'haml-rails', '~> 1.0.0'
  s.add_dependency 'rails', '~> 5.0.2'
  s.add_dependency 'sass-rails', '~> 5.0.4'

  s.add_dependency 'bootstrap-sass', '~> 3.3.7'
  s.add_dependency 'font-awesome-rails', '~> 4.7.0.1'
  s.add_dependency 'govuk_elements_rails', '~> 2.0.0'
  s.add_dependency 'govuk_frontend_toolkit', '~> 4.18.1'
  s.add_dependency 'govuk_template', '~> 0.18.1'
  s.add_dependency 'jquery-rails', '~> 4.3.1'
  s.add_dependency 'lodash-rails', '~> 4.17.4'
  s.add_dependency 'modernizr-rails', '~> 2.7.1'
  s.add_dependency 'modulejs-rails', '~> 2.2.0.0'
  s.add_development_dependency 'rails_real_favicon'
end
