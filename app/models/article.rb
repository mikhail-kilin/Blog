class Article < ApplicationRecord
  include PgSearch

  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: %w[draft published], message: "'%<value>s' is not a status`" }

  belongs_to :user
  belongs_to :company
  has_many :comments, dependent: :destroy

  paginates_per 5

  after_create do
    user.articles_count += 1
    user.save
  end

  after_destroy do
    user.articles_count -= 1
    user.save
  end

  scope :published, -> { where(status: "published") }
  scope :sorted_by_updated_at, -> { order(updated_at: :desc) }
  scope :sorted_by_created_at, -> { order(created_at: :desc) }
  scope :editable, ->(user) { where(user: user).or where(company: user.own_company) }
  pg_search_scope :search_by_data, against: %i[title content], associated_against: { user: :full_name }

  def data
    [created_at, title, comments.count]
  end
end
