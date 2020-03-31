class ArticleDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  delegate :id, :content, :title, :status

  def publication
    "Published #{distance_of_time_in_words_to_now(object.updated_at)} ago"
  end
end
