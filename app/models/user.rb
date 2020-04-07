class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true

  has_many :company_roles
  has_many :companies, through: :company_roles
  has_many :articles
end
