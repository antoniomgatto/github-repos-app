source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.3"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Jquery
gem 'jquery-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Ruby client that supports all of the GitHub
gem 'github_api', '~> 0.18.2'
# A library for bulk inserting data using ActiveRecord.
gem 'activerecord-import', '~> 0.25.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0', '>= 4.0.1'
# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 5.1', '>= 5.1.3'


group :development, :test do
  # Brings back `assigns` and `assert_template` to your Rails tests
  gem 'rails-controller-testing'
  # rspec-rails is a testing framework for Rails 3+.
  gem 'rspec-rails', '~> 3.7'
  # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-collection_matchers', '~> 1.1', '>= 1.1.3'
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  # factory_girl_rails provides integration between factory_girl and rails 3 or newer (currently just automatic factory definition loading)
  gem 'factory_bot_rails', '~> 4.10'
  # Strategies for cleaning databases in Ruby.
  gem 'database_cleaner', '~> 1.7'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails', '~> 0.3.6'
end
