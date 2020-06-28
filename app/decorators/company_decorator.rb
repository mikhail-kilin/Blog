class CompanyDecorator < ApplicationDecorator
  delegate :id, :updated_at, :name

  def avatar
    object.image.url
  end
end
