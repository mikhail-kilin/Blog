class StaticPage < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true
  validates :slug, uniqueness: true

  paginates_per 5

  def to_param
    slug.to_s
  end
end
