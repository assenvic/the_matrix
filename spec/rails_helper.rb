# frozen_string_literal: true

require 'factory_bot_rails'
require 'simplecov'

RSpec.configure do |config|
  SimpleCov.start
  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include(FactoryBot::Syntax::Methods)
end
