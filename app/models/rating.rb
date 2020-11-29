class Rating < ApplicationRecord
  include PgSearch

  validates_associated :user
  validates_associated :article
  validates :rate, inclusion: { in: [1, 2, 3, 4, 5] }

  belongs_to :user
  belongs_to :article
end
