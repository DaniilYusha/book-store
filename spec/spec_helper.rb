require 'config/simplecov'
require 'config/factory_bot'
require 'capybara/rspec'
require 'site_prism'
require 'test_prof/recipes/rspec/let_it_be'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.include Capybara::DSL

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
