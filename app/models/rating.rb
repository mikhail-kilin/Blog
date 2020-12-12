class Rating < ApplicationRecord
  validates :rate, inclusion: { in: [1, 2, 3, 4, 5] }

  belongs_to :user, required: true
  belongs_to :article, required: true
end
