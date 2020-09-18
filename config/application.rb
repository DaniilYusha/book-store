require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookStore
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators do |generator|
      generator.helper false
    end
  end
end
