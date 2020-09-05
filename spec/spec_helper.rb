require 'simplecov'
SimpleCov.start 'rails' do
  minimum_coverage 95
  add_filter '/app/channels'
  add_filter '/app/jobs'
  add_filter '/app/mailers'
  add_filter '/app/models/application_record.rb'
end

require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    config.include Capybara::DSL
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
