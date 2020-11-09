class CommentsNotificationJob < ApplicationJob
  def perform
    User.with_articles.each do |user|
      send_message(user)
    end
    CommentsNotificationJob.set(wait: 1.week).perform_later
  end

  private

  def send_message(user)
    count = count_of_new_comments(user)
    CommentNotificationMailer.with(user: user, count: count).send_message.deliver if count.positive?
  end

  def count_of_new_comments(user)
    (user.articles.map { |a| a.comments.where("created_at > ?", 1.week.ago).count }).sum
  end
end
