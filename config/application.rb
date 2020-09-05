require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookStore
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators do |g|
      g.test_framework :rspec
      g.helper false
      g.assets false
    end

    config.assets.initialize_on_precompile = false
  end
end
