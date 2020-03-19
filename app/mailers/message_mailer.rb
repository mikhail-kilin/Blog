require "byebug"
class MessageMailer < ApplicationMailer
  layout "mailer"

  def send_message
    message = params[:message]
    @name = message.name
    @message = message.content
    @email = message.email

    receiver = User.first

    mail(from: "feedback@form.com", to: receiver.email, subject: "You have a new message")
  end
end
