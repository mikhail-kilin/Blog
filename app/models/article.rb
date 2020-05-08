class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: %w[draft published], message: "'%<value>s' is not a status`" }

  belongs_to :user
  belongs_to :company
  has_many :comments, dependent: :destroy

  paginates_per 5

  scope :published, -> { where(status: "published") }
  scope :sorted, -> { order(updated_at: :desc) }
  scope :sorted_by_create_time, -> { order(created_at: :desc) }
  scope :editable, ->(user) { where(user: user).or where(company: user.own_company) }
end
