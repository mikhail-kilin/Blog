class CommentPolicy < ApplicationPolicy
  def new?
    user.present? &&
      (company.owner == user || company.authors.include?(user))
  end

  def create?
    company.owner == user || company.authors.include?(user)
  end

  def edit?
    manage?
  end

  def update?
    manage?
  end

  def destroy?
    manage?
  end

  def manage?
    record.user == user || record.company.owner == user
  end

  private

  def company
    @company ||= record.company
  end
end
