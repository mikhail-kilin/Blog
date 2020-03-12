require "carrierwave"

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave

  storage :fog

  def store_dir
    "attachments/#{model.id}"
  end

  def cache_dir
    "uploads/tmp/attachments-cache/"
  end

  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
