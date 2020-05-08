class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "avatar/#{model.id}"
  end

  def cache_dir
    "uploads/tmp/avatar-cache/"
  end

  def default_url
    ActionController::Base.helpers.asset_path("avatar.jpg")
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
