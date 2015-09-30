source 'http://rubygems.org'
ruby '2.1.5'

gem 'rails', '3.2.14'
gem 'devise', '~> 2.0.0'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 0.16.0'
gem 'jquery-rails'
gem 'ionicons-rails'
gem 'foreman'

group :development do
  gem 'rubocop'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'jasmine'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers', '~> 1.2'
  gem 'database_cleaner'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'simplecov', require: false
  gem 'turn', '0.8.2', require: false
  gem 'webrat', '~> 0.7.3'
end

group :production do
  gem 'thin'
end

group :assets do
  gem 'jasmine-jquery-rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'therubyracer', platforms: :ruby
  gem 'uglifier', '>= 1.0.3'
end
