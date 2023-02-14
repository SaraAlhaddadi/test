require_relative './vehicle'
module Strategy
  class Bike < Vehicle
    def calculate_route(source, destination)
      [source.length, destination.length].inject(&sum)
    end

    private

    def sum
      ->(source, destination) { source + destination }
    end
  end
end
