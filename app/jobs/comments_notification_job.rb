class CommentsNotificationJob < ApplicationJob
  def perform
    schedule_comments_notifications
    CommentsNotificationJob.set(wait: 1.week).perform_later
  end

  private

  def schedule_comments_notifications
    users_with_articles.each { |user| schedule_comment_notification(user) }
  end

  def schedule_comment_notification(user)
    count = count_of_new_comments(user)

    CommentNotificationMailer.with(user: user, comments_count: count).send_message.deliver if count.positive?
  end

  def count_of_new_comments(user)
    count = user.week_comments_count
    user.update week_comments_count: 0
    count
  end

  def users_with_articles
    User.with_articles
  end
end
