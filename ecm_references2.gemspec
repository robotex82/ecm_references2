$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/references/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_references2'
  s.version     = Ecm::References::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_references2'
  s.summary     = 'References module for ruby on rails.'
  s.description = 'References module for ruby on rails.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'acts_as_list'
  s.add_dependency 'acts_as_markup'
  s.add_dependency 'acts_as_published'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'awesome_nested_set-tools'
  s.add_dependency 'ecm_pictures2'
  s.add_dependency 'friendly_id'
  s.add_dependency 'haml-rails'
  s.add_dependency 'kaminari'
  s.add_dependency 'bootstrap-kaminari-views'

  # Development Server
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'route_translator'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'rails-i18n'
  s.add_development_dependency 'ecm_lightbox2'

  # twitter bootstrap rails
  s.add_development_dependency 'less-rails'
  s.add_development_dependency 'therubyracer'
  s.add_development_dependency 'twitter-bootstrap-rails'

  # active admin
  s.add_development_dependency 'activeadmin', '1.0.0.pre2'
  s.add_development_dependency 'devise'
  s.add_development_dependency 'active_admin-acts_as_list'
  s.add_development_dependency 'active_admin-awesome_nested_set'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'

  s.add_development_dependency 'rubocop'
end
