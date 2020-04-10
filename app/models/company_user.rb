class CompanyUser < ApplicationRecord
  validates :role, inclusion: { in: %w[owner author], message: "'%<value>s' is not a role`" }

  belongs_to :company
  belongs_to :user
end
