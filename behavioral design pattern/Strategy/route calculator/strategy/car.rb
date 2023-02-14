require_relative './vehicle'
module Strategy
  class Car < Vehicle
    def calculate_route(source, destination)
      [source.length, destination.length].inject(&mul)
    end

    private

    def mul
      ->(source, destination) { source * destination }
    end
  end
end
