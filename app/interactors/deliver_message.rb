class DeliverMessage
  include Interactor

  def call
    send_notification if context.message.valid? and return

    context.fail!
  end

  private

  def send_notification
    MessageMailer.with(message: message).send_message.deliver
  end
end

decorator + responders + interactor
