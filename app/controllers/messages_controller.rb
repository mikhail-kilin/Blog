class MessagesController < ApplicationController
  before_action :set_message, only: :create

  def new
  end

  def create
    unless @message.valid?
      redirect_to new_message_path, alert: "Invalid data!" and return
    end
    MessageMailer.with(message: @message).send_message.deliver
    redirect_to root_path, notice: "Feedback was successfully sent!"
  end

  private

  def set_message
    @message = Message.new message_params
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
