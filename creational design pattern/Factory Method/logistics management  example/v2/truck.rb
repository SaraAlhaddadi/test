require_relative './transport.rb'

class Truck < Transport
  def deliver
    puts "deliver to #{@to} by road"
  end
end
