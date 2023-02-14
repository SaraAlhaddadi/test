require_relative './transport.rb'
class Ship < Transport
  def deliver
    puts "deliver to #{@to} by sea"
  end
end