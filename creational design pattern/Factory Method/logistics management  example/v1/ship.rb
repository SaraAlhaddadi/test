class Ship
  def initialize(to)
    @to = to
  end
  def deliver
    puts "deliver to #{@to} by sea"
  end
end