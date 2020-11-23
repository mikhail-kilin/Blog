class CommentPolicy < ApplicationPolicy
  def create?
    company_owner? || company.authors.exists?(user.id)
  end

  def update?
    record.user == user || company_owner?
  end

  alias new? create?
  alias edit? update?
  alias destroy? update?

  private

  def company
    @company ||= record.company
  end

  def company_owner?
    @company_owner ||= company.owner == user
  end
end
