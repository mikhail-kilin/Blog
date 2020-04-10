class CompanyPolicy < ApplicationPolicy
  def edit?
    manage?
  end

  def update?
    manage?
  end

  def manage?
    CompanyUser.find_by(company: @record, user: @user, role: :owner).present?
  end
end
