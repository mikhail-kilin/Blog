class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: %w[draft published], message: "'%<value>s' is not a status`" }

  paginates_per 8

  scope :published, -> { where(status: "published") }
  scope :sorted, -> { order(created_at: :desc) }
end
