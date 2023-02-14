require_relative './vehicle'
module Strategy
  class Boat < Vehicle
    def calculate_route(source, destination)
      [source.length, destination.length].inject(&cube)
    end

    private

    def cube
      ->(source, destination) { source * destination**3 }
    end
  end
end
