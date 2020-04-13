class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def all_companies
    object.companies.to_a.push object.own_company
  end
end
