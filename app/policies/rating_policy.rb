class RatingPolicy < ApplicationPolicy
  def create?
    user.present? && Rating.find_by(article: record.article, user: record.user).blank?
  end

  def update?
    user.present?
  end
end
