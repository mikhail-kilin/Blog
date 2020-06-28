class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :own_company

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def all_companies
    if object.own_company
      object.companies.to_a.push object.own_company
    else
      object.companies.to_a
    end
  end

  def avatar
    object.avatar.url
  end
end
