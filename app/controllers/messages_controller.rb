class MessagesController < ApplicationController
  expose :message

  def new
  end

  def create
    result = DeliverMessage.call( { message: message } )

    if result.success?
      redirect_to root_path, notice: "Feedback was successfully sent!"
    else
      redirect_to new_message_path, alert: "Invalid data!"
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
