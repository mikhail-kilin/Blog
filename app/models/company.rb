class Company < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
  validates :slug, uniqueness: true
  validates :slug, format: { with: /\A[a-zA-Zа-яА-Я\-]+\z/,
                             message: "only allows letters and -" }

  mount_uploader :image, CompanyAvatarUploader

  belongs_to :owner, foreign_key: "owner_id", class_name: "User", inverse_of: :own_company
  has_and_belongs_to_many :authors, association_foreign_key: "author_id", class_name: "User", inverse_of: :companies
  has_many :articles
  has_many :comments, through: :articles

  paginates_per 5

  scope :sorted, -> { order(updated_at: :desc) }

  accepts_nested_attributes_for :owner, :authors

  def to_param
    slug.to_s
  end
end
