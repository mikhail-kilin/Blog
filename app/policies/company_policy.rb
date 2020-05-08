class CompanyPolicy < ApplicationPolicy
  def show?
    manage?
  end

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

  def become_to_author?
    @user.present? && !@record.authors.include?(@user)
  end

  def manage?
    @record.owner == @user
  end
end
