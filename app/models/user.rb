class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true
end
