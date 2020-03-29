class ArticlePolicy < ApplicationPolicy
  def show?
    manage? || @record.status == "published"
  end

  def new?
    manage?
  end

  def create?
    manage?
  end

  def edit?
    manage?
  end

  def update?
    manage?
  end

  def manage?
    @user.present?
  end
end
