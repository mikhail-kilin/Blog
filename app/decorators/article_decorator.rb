class ArticleDecorator < ApplicationDecorator
  delegate :id, :content, :title, :status

  def publication
    count = (DateTime.now.to_i - object.created_at.to_i) / 1.day
    if count.zero?
      "Published today"
    elsif count == 1
      "Published yesterday"
    else
      "Published #{count} days ago"
    end
  end
end
