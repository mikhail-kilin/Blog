class Company < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
  validates :slug, uniqueness: true

  mount_uploader :image, CompanyAvatarUploader

  has_many :company_users
  has_many :users, through: :company_users
  has_many :articles

  def to_param
    slug.to_s
  end
end
