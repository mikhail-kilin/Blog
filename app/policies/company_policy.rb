class CompanyPolicy < ApplicationPolicy
  def create?
    @user.own_company.blank?
  end

  def become_to_author?
    user.present? && !record.authors.include?(user)
  end

  def update?
    record.owner == user
  end

  alias new? create?
  alias edit? update?
  alias destroy? update?
  alias show? update?
end
