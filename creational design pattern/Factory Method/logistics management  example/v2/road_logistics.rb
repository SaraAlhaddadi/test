require_relative 'truck'
require_relative './logistics.rb'

class RoadLogistics < Logistics
  def transport
    Truck.new(to)
  end
end
