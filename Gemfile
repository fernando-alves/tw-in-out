source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'devise'
gem 'omniauth-google-oauth2'

group :development, :test do
  gem "rspec-rails", "~> 2.11.0"
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'sqlite3'
  gem 'pry'
end

group :test do
  gem "rspec", "~> 2.11.0"
  gem 'rspec-instafail'
  gem 'shoulda-matchers', '~> 1.2'
  gem 'database_cleaner'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'simplecov', :require => false
  gem 'turn', '0.8.2', :require => false
  gem "webrat", "~> 0.7.3"
end

group :production do
  gem "pg", "~> 0.14.1"
  gem 'thin'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
