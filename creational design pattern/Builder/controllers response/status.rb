class Status
  attr_reader :code, :message

  def initialize(code:200, message:"Success")
    @code = code
    @message = message
  end

  def to_s
    "HTTP1/1 #{code} #{message}"
  end
end
