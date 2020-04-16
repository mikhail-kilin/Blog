class CompanyAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "company-avatar/#{model.id}"
  end

  def cache_dir
    "uploads/tmp/company-avatar-cache/"
  end

  def default_url
    ActionController::Base.helpers.asset_path("company.jpeg")
  end

  def extension_whitelist
    %w[jpg jpeg gif png] 
  end
end
