class MessagesController < ApplicationController
  def new
  end

  def create
    MessageMailer.with(message_params).send_message.deliver
    redirect_to root_path, notice: "Feedback was successfully sent!"
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content).to_hash
  end
end
