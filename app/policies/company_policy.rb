class CompanyPolicy < ApplicationPolicy
  def edit?
    manage?
  end

  def update?
    manage?
  end

  def manage?
    @record.owner == @user
  end
end
