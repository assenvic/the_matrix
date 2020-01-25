require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'database_cleaner'
require 'rspec/rails'
require 'factory_bot_rails'
require 'shoulda/matchers'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit(1)
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework(:rspec)
    with.library(:rails)
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include(RSpec::Rails::RequestExampleGroup,
    type: :request,
    file_path: %r{/spec\/api/})

  config.use_transactional_fixtures = false

  # Cleanup the database
  DatabaseCleaner.allow_remote_database_url = true

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner[:active_record].strategy = :transaction
  end

  config.before(:each, truncate: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/system/*/**"])
  end
end
