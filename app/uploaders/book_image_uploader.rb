class BookImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :aws
  storage :file if Rails.env.test?

  def default_url
    'default.jpg'
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :w170 do
    process resize_to_fit: [170, nil]
  end

  version :w210 do
    process resize_to_fit: [210, nil]
  end

  version :w550 do
    process resize_to_fit: [550, nil]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
