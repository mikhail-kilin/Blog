class CommentPolicy < ApplicationPolicy
  def new?
    company = @record.company
    user.present? &&
      (company.owner == @user.user || company.authors.include?(@user.user))
  end

  def create?
    company = @record.company
    company.owner == @user || company.authors.include?(@user)
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
    @record.user == @user || @record.company.owner == @user
  end
end
