class CommentPolicy < ApplicationPolicy
  def create?
    user.present? &&
      (company.owner == user || company.authors.include?(user))
  end

  def update?
    record.user == user || record.company.owner == user
  end

  alias new? create?
  alias edit? update?
  alias destroy? update?

  private

  def company
    @company ||= record.company
  end
end
