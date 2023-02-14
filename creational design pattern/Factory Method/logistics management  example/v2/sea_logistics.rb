require_relative './logistics.rb'
require_relative 'ship'

class SeaLogistics < Logistics
  def transport
    Ship.new(to)
  end
end
