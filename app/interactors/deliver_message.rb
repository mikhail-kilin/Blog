class DeliverMessage
  include Interactor

  def call
    send_notification and return if context.message.valid?

    context.fail!
  end

  private

  def send_notification
    MessageMailer.with(message: context.message, company: context.company).send_message.deliver
  end
end
