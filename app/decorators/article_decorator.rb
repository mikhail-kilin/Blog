class ArticleDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  delegate :id, :content, :title, :status, :comments

  def publication
    "Published #{distance_of_time_in_words_to_now(object.updated_at)} ago"
  end

  def prev_content
    helper = ActionController::Base.helpers
    helper.truncate helper.strip_tags(content), length: 350
  end

  def author
    "by #{object.user.full_name}"
  end
end
