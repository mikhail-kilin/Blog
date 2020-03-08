class User < ApplicationRecord
  devise :database_authenticatable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :lockable,
    :registerable

  validates :full_name, presence: true
end
