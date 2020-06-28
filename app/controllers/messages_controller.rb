class MessagesController < ApplicationController
  expose :message
  expose :company, -> { set_company }

  def new
  end

  def create
    result = DeliverMessage.call message: message, company: company

    if result.success?
      redirect_to root_path, notice: "Feedback was successfully sent!"
    else
      redirect_to new_company_message_path(company), alert: "Invalid data!"
    end
  end

  private

  def set_company
    Company.find_by slug: params[:company_id]
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
