class Asset < ApplicationRecord
  include Redactor2Rails::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :size, :content_type, :filename, to: :data
  validates :data, presence: true
end
