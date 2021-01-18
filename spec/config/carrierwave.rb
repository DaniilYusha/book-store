CarrierWave.configure do |config|
  config.root = Rails.root.join('spec/fixtures')
  # config.cache_only  = true
  # config.enable_processing = false
  # config.base_path = "/"
end
