class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :article
  has_one :company, through: :article

  scope :sorted, -> { order(created_at: :asc) }
end
