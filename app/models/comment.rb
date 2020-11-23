class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :article
  has_one :company, through: :article

  after_create do
    user.comments_count += 1
    user.save
  end

  after_destroy do
    user.comments_count -= 1
    user.save
  end

  scope :last_week_comments, -> { where("created_at > ?", 1.week.ago) }
  scope :sorted_by_created_at, -> { order(created_at: :asc) }
end
