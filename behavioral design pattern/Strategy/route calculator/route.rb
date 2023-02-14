require_relative './strategy/bike'
require_relative './strategy/car'
require_relative './strategy/boat'

class Route
  attr_writer :vehicle

  def initialize(current_location, vehicle)
    @current_location = current_location
    @vehicle = vehicle
    @distance = nil
  end

  def distance(distance)
    @distance = distance
    hours
  end

  private

  def hours
    @vehicle.calculate_route(@current_location, @distance)
  end
end

route = Route.new('Home', Strategy::Car.new)
puts "via Car: #{route.distance('Aden')} hours"

route = Route.new('Home', Strategy::Bike.new)
puts "via Bike: #{route.distance('Aden')} hours"

route = Route.new('Home', Strategy::Boat.new)
puts "via Boat: #{route.distance('Aden')} hours"
