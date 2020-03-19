class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :status, inclusion: { in: %w[draft published], message: "'%<value>s' is not a status`" }

  paginates_per 10
end
