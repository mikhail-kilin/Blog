class MessageMailer < ApplicationMailer
  layout "mailer"

  def send_message
    @name = params[:name]
    @message = params[:content]
    @email = params[:email]

    receiver = User.first

    mail(from: "feedback@form.com", to: receiver.email, subject: 'You have a new message')
  end
end
