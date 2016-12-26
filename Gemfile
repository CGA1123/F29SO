source 'https://rubygems.org'

ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
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

gem 'puma'
gem 'devise'

gem 'premailer-rails'

group :development, :test, :macs_development, :macs_test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', require: false
  gem 'rubocop', '~> 0.45.0', require: false
  gem 'reek'
  gem 'rubocop-rspec'
end

group :development, :macs_development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rails-erd'
end

group :test, :macs_test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', require: nil
end

group :macs_test, :macs_development do
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
end

# Add gems specific to windows
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
