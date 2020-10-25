class CommentNotificationMailer < ApplicationMailer
  layout "mailer"

  def send_message
    @user = params[:user]
    @count = params[:count]

    mail(to: @user.email, subject: "Your articles have new comments")
  end
end
