$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/translations/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_translations2'
  s.version     = Ecm::Translations::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_translations'
  s.summary     = 'ECM Translations 2 Module.'
  s.description = 'Provides database storage and UI for I18n translations.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails'
  s.add_dependency 'i18n-active_record'

  # Development Server
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'devise'
  s.add_development_dependency 'activeadmin'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'localeapp'
  s.add_development_dependency 'route_translator'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'

  s.add_development_dependency 'rubocop'
end
