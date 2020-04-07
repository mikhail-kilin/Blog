class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: %w[draft published], message: "'%<value>s' is not a status`" }

  belongs_to :user
  belongs_to :company

  paginates_per 5

  scope :published, -> { where(status: "published") }
  scope :sorted, -> { order(updated_at: :desc) }
  scope :sorted_by_create_time, -> { order(created_at: :desc) }
end
