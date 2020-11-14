class CommentsNotificationJob < ApplicationJob
  def perform
    users.each do |user|
      send_message(user)
    end
    CommentsNotificationJob.set(wait: 1.week).perform_later
  end

  private

  def send_message(user)
    comments_count = count_of_new_comments(user)
    CommentNotificationMailer.with(user: user, count: comments_count).send_message.deliver if comments_count.positive?
  end

  def count_of_new_comments(user)
    user.last_week_comments_count
  end

  def users
    User.with_articles
  end
end
