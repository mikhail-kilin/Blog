class Message
  attr_reader :name, :email, :content

  def initialize(params)
    @name = params["name"]
    @email = params["email"]
    @content = params["content"]
  end

  def valid?
    name.present? && content.present? && email.present?
  end
end
