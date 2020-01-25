source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'grape'
gem 'grape-entity'
gem 'grape-swagger', '0.11.0' # grape-swagger v0.20.0 and v0.20.1 break Swagger
gem 'grape-swagger-rails'

gem 'pg', '~> 1.0'
gem 'puma', '~> 3.11'
gem 'rack-cors', require: 'rack/cors'
gem 'rack-timeout', '~> 0.5'
gem 'rails', '~> 5.2.0'
gem 'sidekiq', '~> 5.1'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rack-mini-profiler', '~> 1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rubocop', '~> 0.58.2', require: false
  gem 'rspec-rails'
end

gem 'tzinfo-data'
