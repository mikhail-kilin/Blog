class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "pictures/#{model.id}"
  end

  def cache_dir
    "uploads/tmp/pictures-cache/"
  end

  version :thumb do
    process resize_to_fill: [118, 100]
  end

  version :content do
    process resize_to_limit: [800, 800]
  end

  def extension_white_list
    Ckeditor.image_file_types
  end
end
