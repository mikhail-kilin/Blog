class CommentPolicy < ApplicationPolicy
  def new?
    user.present? &&
      (@record.company.owner == @user || @record.company.authors.include?(@user.user))
  end

  def create?
    @record.company.owner == @user || @record.company.authors.include?(@user)
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
