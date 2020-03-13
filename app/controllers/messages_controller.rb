class MessagesController < ApplicationController
  def new
  end

  def create
    MessageMailer.with(message_params).send_message.deliver_later
    redirect_to root_path, notice: 'Feedback was successfully sent!'
  end

  private

  def message_params
    { name: params[:name], email: params[:email], content: params[:content] }
  end
end
