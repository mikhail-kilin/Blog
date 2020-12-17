class ArticleDecorator < ApplicationDecorator
  delegate :id, :content, :title, :status, :comments, :updated_at

  def prev_content
    helper = ActionController::Base.helpers
    helper.truncate helper.strip_tags(content), length: 350
  end

  def author
    "by #{object.user.full_name} (#{object.user.email})"
  end

  def sorted_comments
    object.comments.sorted_by_created_at
  end

  def rating
    return "Nobody has rated on this article yet" unless object.ratings.any?

    "#{object.ratings.average(:rate).round(2)}/5"
  end
end
