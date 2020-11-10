require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BookStore
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators do |generator|
      generator.helper false
    end

    config.active_storage.variant_processor = :mini_magick
  end
end
