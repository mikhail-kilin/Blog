class ArticlePolicy < ApplicationPolicy
  def show?
    manage? || @record.status == "published"
  end

  def new?
    user.present?
  end

  def create?
    user.present?
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
    record.company.owner == user || record.user == user
  end
end
