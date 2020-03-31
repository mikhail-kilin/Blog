class StaticPage < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true
  validates :slug, uniqueness: true

  def to_param
    slug.to_s
  end
end
