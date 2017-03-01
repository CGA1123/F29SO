source 'https://rubygems.org'

ruby '2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'respond-js-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'initialjs-rails'
gem 'premailer-rails'
gem 'puma'
gem 'sidekiq'

gem 'octicons_helper'

group :development, :test, :macs_development, :macs_test do
  gem 'byebug'
  gem 'factory_girl_rails', require: false
  gem 'reek'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop', '~> 0.46.0', require: false
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
end

group :development, :macs_development do
  gem 'rails-erd'
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :test, :macs_test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'simplecov'
end

group :macs_test, :macs_development do
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
end

# Add gems specific to windows
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
