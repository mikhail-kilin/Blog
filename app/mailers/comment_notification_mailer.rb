class CommentNotificationMailer < ApplicationMailer
  layout "mailer"

  def send_message
    @user = params[:user]
    @comments_count = params[:comments_count]

    mail(to: @user.email, subject: "Your articles have new comments")
  end
end
