# main Objects (products) interface
class Transport
  def initialize(to)
    @to = to
  end

  def deliver
    raise NotImplementedError
  end
end
