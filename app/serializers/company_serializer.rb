class CompanySerializer < ActiveModel::Serializer
  has_many :authors

  attributes :owner
end
