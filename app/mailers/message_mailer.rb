class MessageMailer < ApplicationMailer
  layout "mailer"

  def send_message
    message = params[:message]
    @name = message.params["name"]
    @message = message.params["content"]
    @email = message.params["email"]

    receiver = params[:company].owner

    mail(to: receiver.email, subject: "You have a new message")
  end
end
