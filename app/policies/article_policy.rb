class ArticlePolicy < ApplicationPolicy
  def show?
    record.status == "published" || update?
  end

  def create?
    user.present?
  end

  def update?
    record.company.owner == user || record.user == user
  end

  alias new? create?
  alias edit? update?
  alias destroy? update?
end
