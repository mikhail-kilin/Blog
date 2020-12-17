class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :article
  has_one :company, through: :article

  after_create do
    user.comments_count += 1
    user.week_comments_count += 1
    user.save
  end

  after_destroy do
    user.comments_count -= 1
    user.save
  end

  scope :sorted_by_created_at, -> { order(created_at: :asc) }
end
