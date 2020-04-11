class CompanyPolicy < ApplicationPolicy
  def edit?
    manage?
  end

  def update?
    manage?
  end

  def new?
    @user.own_company.blank?
  end

  def create?
    new?
  end

  def manage?
    @record.owner == @user
  end
end
