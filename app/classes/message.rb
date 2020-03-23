class Message
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def valid?
    @params["name"].present? && @params["content"].present? && @params["email"].present?
  end
end
