class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include Piet::CarrierWaveExtension
  # include CarrierWave::MiniMagick
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def extension_whitelist
    %w(jpg jpeg gif png HEIC HEIF heic heif)
  end

  process optimize: [quality: 10]
  process :resize_to_fit => [700, 700]
  process :convert => 'jpg'

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end
 
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end
 
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end


end
