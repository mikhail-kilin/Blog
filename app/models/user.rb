class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true

  has_and_belongs_to_many :companies, foreign_key: "author_id", inverse_of: :authors
  has_one :own_company, class_name: "Company", foreign_key: "owner_id", inverse_of: :owner
  has_many :articles
  has_many :comments

  accepts_nested_attributes_for :own_company, :companies

  scope :with_comments, -> { where("comments_count > 0") }
  scope :without_comments, -> { where(comments_count: 0) }
  scope :with_articles, -> { where("articles_count > 0") }
  scope :without_articles, -> { where(articles_count: 0) }

  def last_week_comments_count
    articles.map(&:last_week_comments_count).sum
  end

  scope :sorted_by_comments_count, -> { order(:comments_count) }
end
